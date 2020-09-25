import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skull/src/model/room_type_model.dart';
import 'package:skull/src/model/user_model.dart';
import 'package:skull/src/utils/http.dart';

import 'preference_service.dart';

class HttpServices {
  final Dio http;
  final SharePreferenceService sharePreferenceService;
  HttpServices(this.http, this.sharePreferenceService) {
    dio.interceptors.add(
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
            // Fluttertoast.showToast(msg: 'mes');
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
          Fluttertoast.cancel();
          Fluttertoast.showToast(msg: e.message);
        },
      ),
    );
  }

  Future<UserModel> login(String username, String password) async {
    final data = {"username": username, "password": password};
    Response response = await http.post('/auth/signIn', data: data);
    print(response.data);
    // return UserModel.fromJson(response.data);
  }

  Future<List<RoomTypeModel>> getRoomType() async {
    Response response = await http.get('/roomType/listAll');
    return (response.data['data'] as List)
        .map((e) => RoomTypeModel.fromJson(e))
        .toList();
  }
}
