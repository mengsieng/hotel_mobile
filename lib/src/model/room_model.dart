class RoomModel {
  int id;
  String number;
  int roomStatusId;
  int roomTypeId;
  RoomType roomType;
  Status status;

  RoomModel(
      {this.id,
      this.number,
      this.roomStatusId,
      this.roomTypeId,
      this.roomType,
      this.status});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    roomStatusId = json['room_status_id'];
    roomTypeId = json['room_type_id'];
    roomType = json['roomType'] != null
        ? new RoomType.fromJson(json['roomType'])
        : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['room_status_id'] = this.roomStatusId;
    data['room_type_id'] = this.roomTypeId;
    if (this.roomType != null) {
      data['roomType'] = this.roomType.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class RoomType {
  int id;
  String type;
  String description;
  int bed;
  int price;

  RoomType({this.id, this.type, this.description, this.bed, this.price});

  RoomType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    bed = json['bed'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['description'] = this.description;
    data['bed'] = this.bed;
    data['price'] = this.price;
    return data;
  }
}

class Status {
  int id;
  String status;

  Status({this.id, this.status});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}
