import 'package:dio/dio.dart';
import 'package:skull/src/utils/base_url.dart';

BaseOptions options = new BaseOptions(
  baseUrl: BaseUrl.baseUrl,
  connectTimeout: 10000,
  receiveTimeout: 5000,
);

Dio dio = new Dio(options);
