import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopapp/models/loginmodel/loginmodel.dart';

class LoginServices {
  static String baseurl = 'https://student.valuxapps.com/api/login';

  static Future<LogInModel> postdata(
      {required String email, required String password}) async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.post(url, body: {
      'email': email,
      'password': password
    }, headers: {
      // 'Content-Type': 'application/json',
      'lang': 'ar',
    });
    LogInModel data = LogInModel.fromjson(jsonDecode(response.body));
    print(data.message);
    return data;
  }
}
