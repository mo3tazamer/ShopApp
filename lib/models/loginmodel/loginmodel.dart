class LogInModel {
  dynamic status;
  String message;
  LoginData? data;

  LogInModel({required this.status, required this.message, required this.data});

  factory LogInModel.fromjson(Map<String, dynamic> json) {
    return LogInModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? LoginData.formjson(json['data']) : null,
    );
  }
}

class LoginData {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic image;
  dynamic points;
  dynamic credit;
  dynamic token;

  LoginData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});

  factory LoginData.formjson(Map<String, dynamic> json) {
    return LoginData(
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
