import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_loading/flutter_native_loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/model/user_model.dart';
import 'package:skull/src/provider/booking_provider.dart';
import 'package:skull/src/provider/home_provider.dart';
import 'package:skull/src/services/http_services.dart';
import 'package:skull/src/services/preference_service.dart';
import 'package:skull/src/utils/route_name.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthProvider extends ChangeNotifier {
  final HttpServices http;
  final SharePreferenceService preferenceService;
  AuthProvider(this.http, this.preferenceService);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  setGender(String gender) {
    genderController.text = gender;
    notifyListeners();
  }

  setDate(String date) {
    dobController.text = date.split(' ')[0];
    notifyListeners();
  }

  clear() {
    usernameController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    genderController.clear();
    dobController.clear();
    phoneNumberController.clear();
    notifyListeners();
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void signUp(BuildContext context) async {
    final HomeProvider homeProvider = Provider.of(context, listen: false);
    final BookingProvider bookingProvider = Provider.of(context, listen: false);
    try {
      FlutterNativeLoading.show();
      if (!validateStructure(passwordController.text)) {
        Fluttertoast.showToast(msg: 'createAccount.error'.tr());
        FlutterNativeLoading.hide();
      } else {
        final response = await http.signUp(
          username: usernameController.text,
          password: passwordController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          gender: genderController.text,
          date: dobController.text.split(' ')[0],
          phonenumber: phoneNumberController.text,
        );
        await preferenceService.setUser(response.data);
        await preferenceService.saveToken(response.token);
        FlutterNativeLoading.hide();
        await homeProvider.init();
        await bookingProvider.init();
        Navigator.popAndPushNamed(context, Home);
      }
    } on DioError catch (e) {
      FlutterNativeLoading.hide();
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void login(BuildContext context, {String username, String password}) async {
    final HomeProvider homeProvider = Provider.of(context, listen: false);
    final BookingProvider bookingProvider = Provider.of(context, listen: false);
    try {
      FlutterNativeLoading.show();
      UserModel response = await http.login(username, password);
      await preferenceService.setUser(response.data);
      await preferenceService.saveToken(response.token);
      FlutterNativeLoading.hide();
      await homeProvider.init();
      await bookingProvider.init();
      Navigator.popAndPushNamed(context, Home);
    } on DioError catch (e) {
      FlutterNativeLoading.hide();
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void logout(
    BuildContext context,
  ) {
    FlutterNativeLoading.show();
    preferenceService.removeToken();
    FlutterNativeLoading.hide();
    Navigator.popAndPushNamed(context, Welcome);
  }
}
