class RoomTypeModel {
  int id;
  String type;
  String description;
  int bed;
  int price;
  List<Images> images;

  RoomTypeModel(
      {this.id,
      this.type,
      this.description,
      this.bed,
      this.price,
      this.images});

  RoomTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    bed = json['bed'];
    price = json['price'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['description'] = this.description;
    data['bed'] = this.bed;
    data['price'] = this.price;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int id;
  String imageUrl;
  int roomTypeId;

  Images({this.id, this.imageUrl, this.roomTypeId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    roomTypeId = json['roomType_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['roomType_id'] = this.roomTypeId;
    return data;
  }
}
