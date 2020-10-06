class UserModel {
  String token;
  Data data;
  int statusCode;

  UserModel({this.token, this.data, this.statusCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Data {
  int id;
  String username;
  String firstName;
  String lastName;
  String dOB;
  String gender;
  String phonenumber;
  Null profileUrl;

  Data(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.dOB,
      this.gender,
      this.phonenumber,
      this.profileUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dOB = json['DOB'];
    gender = json['gender'];
    phonenumber = json['phonenumber'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['DOB'] = this.dOB;
    data['gender'] = this.gender;
    data['phonenumber'] = this.phonenumber;
    data['profileUrl'] = this.profileUrl;
    return data;
  }
}
