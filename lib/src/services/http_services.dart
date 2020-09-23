import 'package:dio/dio.dart';
import 'package:flutter_native_loading/flutter_native_loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skull/src/utils/http.dart';

class HttpServices {
  final Dio http;
  HttpServices(this.http) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          FlutterNativeLoading.show();
          dio.interceptors.requestLock.lock();
          // final token = await SharePreferenceService.getDToken();
          dio.interceptors.requestLock.unlock();
          // options.headers.addAll({"Authorization": "Bearer $token"});
          return options; //continue
        },
        onResponse: (Response response) async {
          FlutterNativeLoading.hide();
          return response; // continue
        },
        onError: (DioError e) async {
          FlutterNativeLoading.hide();
          Fluttertoast.cancel();
          Fluttertoast.showToast(msg: e.message);
        },
      ),
    );
  }

  Future<void> getData() async {
    Response response = await http.get('/posts');
    print(response.data);
  }
}
