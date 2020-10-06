import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_loading/flutter_native_loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skull/src/model/room_model.dart';
import 'package:skull/src/model/user_model.dart';
import 'package:skull/src/services/http_services.dart';
import 'package:skull/src/services/preference_service.dart';

class BookingProvider extends ChangeNotifier {
  final HttpServices http;
  final SharePreferenceService sharePreferenceService;
  BookingProvider(this.http, this.sharePreferenceService) {
    init();
  }

  Data user;
  RoomModel _room;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController checkInController = TextEditingController();
  TextEditingController checkOutController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  String checkDate;

  init() async {
    user = await sharePreferenceService.getUser();
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    phoneNumberController.text = user.phonenumber;
    dobController.text = user.dOB.split('T')[0];
    notifyListeners();
  }

  clear() {
    checkInController.clear();
    roomNumberController.clear();
    checkDate = '';
    notifyListeners();
  }

  setDate(String newDate) {
    checkDate = newDate;
    checkInController.text = newDate.split(' ')[0];
    notifyListeners();
  }

  gotoBooking(ScrollController scrollController, int length) {
    if (length > 4) {
      length = 4;
    }
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.offset + (length * 120),
        curve: Curves.linear,
        duration: Duration(milliseconds: 500),
      );
      notifyListeners();
    }
  }

  createBooking() async {
    FlutterNativeLoading.show();
    try {
      await http.createBooking(
        roomId: _room.id,
        checkInDate: checkDate,
      );
      clear();
      FlutterNativeLoading.hide();
    } on DioError catch (e) {
      FlutterNativeLoading.hide();
      Fluttertoast.showToast(msg: '');
    }
  }

  set room(RoomModel newRoom) {
    _room = newRoom;
    roomNumberController.text = newRoom.number;
    notifyListeners();
  }

  get room => _room;
}
