class ProFileModel {
  dynamic status;
  dynamic message;
  ProFileData? data;

  ProFileModel(
      {required this.status, required this.message, required this.data});

  factory ProFileModel.fromjson(Map<String, dynamic> json) {
    return ProFileModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? ProFileData.formjson(json['data']) : null,
    );
  }
}

class ProFileData {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic image;
  dynamic points;
  dynamic credit;
  dynamic token;

  ProFileData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});

  factory ProFileData.formjson(Map<String, dynamic> json) {
    return ProFileData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }
}
