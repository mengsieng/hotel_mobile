import 'package:flutter/material.dart';
import 'package:skull/src/model/room_type_model.dart';
import 'package:skull/src/model/user_model.dart';
import 'package:skull/src/services/http_services.dart';

import '../services/preference_service.dart';

class HomeProvider extends ChangeNotifier {
  final HttpServices http;
  final SharePreferenceService preferenceService;

  Data user;
  List<RoomTypeModel> roomModel = [];

  TextEditingController password = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();

  HomeProvider(this.http, this.preferenceService) {
    init();
  }

  init() async {
    user = await preferenceService.getUser();
    roomModel = await http.getRoomType();
    print(user.username);
    notifyListeners();
  }

  getUser() {
    gender.text = user.gender;
    dob.text = user.dOB.split('T')[0];
    firstName.text = user.firstName;
    lastName.text = user.lastName;
    // password.text = user;
    notifyListeners();
  }
}
