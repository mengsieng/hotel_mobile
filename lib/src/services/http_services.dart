import 'package:dio/dio.dart';
import 'package:flutter_native_loading/flutter_native_loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skull/src/model/my_booking_model.dart';
import 'package:skull/src/model/room_model.dart';
import 'package:skull/src/model/room_type_model.dart';
import 'package:skull/src/model/user_model.dart';
import 'package:skull/src/utils/base_url.dart';
import 'package:skull/src/utils/http.dart';

import 'preference_service.dart';

class HttpServices {
  final Dio http;
  final SharePreferenceService sharePreferenceService;
  HttpServices(this.http, this.sharePreferenceService) {
    http.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          // FlutterNativeLoading.show();
          dio.interceptors.requestLock.lock();
          final token = await sharePreferenceService.getToken();
          dio.interceptors.requestLock.unlock();
          options.headers.addAll({"Authorization": "Bearer $token"});
          return options; //continue
        },
        onResponse: (Response response) async {
          if (response.data['statusCode'] != 1) {
            // return Fluttertoast.showToast(msg: 'mes');
            return throw DioError(
              type: DioErrorType.RESPONSE,
              response: response,
              request: response.request,
            );
          }
          return response; // continue
        },
        onError: (DioError e) async {
          // FlutterNativeLoading.hide();
          // print('=====>' + e.response.data);
          // if (e.response.data['statusCode'] != 1) {
          //   FlutterNativeLoading.hide();
          //   Fluttertoast.showToast(msg: 'sd');
          // } else {
          //   FlutterNativeLoading.hide();
          //   Fluttertoast.cancel();
          // }
          // return Fluttertoast.showToast(msg: e.response.data["massage"]);
          return e.response.data["massage"];
          // return e;
          // return 'Something want wrong';
        },
      ),
    );
  }

  Future<UserModel> login(String username, String password) async {
    final data = {
      "username": username,
      "password": password,
    };
    print(data);
    Response response = await http.post('/auth/signIn', data: data);
    print(response.data);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> signUp(
      {String username,
      String password,
      String firstName,
      String lastName,
      String gender,
      String date,
      String phonenumber}) async {
    final data = {
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "username": username,
      "DOB": date,
      "gender": gender,
      "phonenumber": phonenumber,
      "profileUrl": ""
    };
    Response response = await http.post(BaseUrl.signUp, data: data);
    return UserModel.fromJson(response.data);
  }

  Future<List<RoomTypeModel>> getRoomType() async {
    Response response = await http.get(
      '/roomType/listAll',
    );
    return (response.data['data'] as List)
        .map((e) => RoomTypeModel.fromJson(e))
        .toList();
  }

  Future<String> changePassword(String oldPassword, String newPassword) async {
    final data = {"oldPassword": oldPassword, "newPassword": newPassword};
    Response response = await http.patch(BaseUrl.passwordChange, data: data);
    return response.data['massage'];
  }

  Future<List<RoomModel>> getRoomNumber(int roomType) async {
    final qs = {"room_type_id": roomType};
    Response response = await http.get(BaseUrl.roomNumber, queryParameters: qs);
    return (response.data['data'] as List)
        .map((e) => RoomModel.fromJson(e))
        .toList();
  }

  Future<List<MyBookingModel>> getMyBooking({int max = 5, int offset}) async {
    final qs = {
      'max': max,
      'offset': offset,
    };
    Response response = await http.get(BaseUrl.myBooking, queryParameters: qs);
    return (response.data['data'] as List)
        .map((e) => MyBookingModel.fromJson(e))
        .toList();
  }

  Future<void> createBooking({int roomId, String checkInDate}) async {
    final data = {
      "room_id": roomId,
      "checkin_date": checkInDate,
    };
    await http.post(BaseUrl.createBooking, data: data);
  }

  getLanguage() {}
}
