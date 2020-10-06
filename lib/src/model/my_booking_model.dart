import 'package:skull/src/model/room_model.dart';

class MyBookingModel {
  int id;
  String bookingDate;
  String checkinDate;
  String checkoutDate;
  int bookingStatusId;
  int roomId;
  int userId;
  Status status;
  RoomModel room;

  MyBookingModel(
      {this.id,
      this.bookingDate,
      this.checkinDate,
      this.checkoutDate,
      this.bookingStatusId,
      this.roomId,
      this.userId});

  MyBookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingDate = json['booking_date'];
    checkinDate = json['checkin_date'];
    checkoutDate = json['checkout_date'];
    bookingStatusId = json['booking_status_id'];
    roomId = json['room_id'];
    userId = json['user_id'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    room = json['room'] != null ? new RoomModel.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_date'] = this.bookingDate;
    data['checkin_date'] = this.checkinDate;
    data['checkout_date'] = this.checkoutDate;
    data['booking_status_id'] = this.bookingStatusId;
    data['room_id'] = this.roomId;
    data['user_id'] = this.userId;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room.toJson();
    }
    return data;
  }
}
