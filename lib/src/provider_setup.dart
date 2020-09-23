import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:skull/src/provider/home_provider.dart';
import 'package:skull/src/services/http_services.dart';
import 'package:skull/src/services/preference_service.dart';
import 'package:skull/src/utils/http.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableWidget,
];

List<SingleChildWidget> independentServices = [
  Provider<Dio>.value(value: dio),
  Provider<SharePreferenceService>.value(value: sharePreferenceService),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Dio, HttpServices>(
    update: (context, dio, _) {
      return HttpServices(dio);
    },
  ),
];

List<SingleChildWidget> uiConsumableWidget = [
  ChangeNotifierProxyProvider<HttpServices, HomeProvider>(
    create: null,
    update: (context, http, previous) => HomeProvider(http),
  ),
];
