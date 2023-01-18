import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopapp/conestants/const.dart';
import 'package:shopapp/models/loginmodel/loginmodel.dart';

class UpdateProFileServices {
  static String baseurl = 'https://student.valuxapps.com/api/update-profile';

  static Future<LogInModel> putdata(
      {required String name,
      required String email,
      required String phone}) async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.put(url, body: {
      'name': name,
      'email': email,
      'phone': phone,
    }, headers: {
      'Authorization': token,
      // 'Content-Type': 'application/json',
      'lang': 'ar',
    });
    LogInModel data = LogInModel.fromjson(jsonDecode(response.body));
    print(data.status);
    return data;
  }
}
