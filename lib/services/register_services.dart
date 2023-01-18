import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Registermodel/Registermodel.dart';

class RegisterServices {
  static String baseurl = 'https://student.valuxapps.com/api/register';

  static Future<RegisterModel> postdata(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.post(url, body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password
    }, headers: {
      // 'Content-Type': 'application/json',
      'lang': 'ar',
    });
    RegisterModel data = RegisterModel.fromJson(jsonDecode(response.body));
    print(data.message);
    return data;
  }
}
