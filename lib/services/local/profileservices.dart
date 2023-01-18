import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../conestants/const.dart';
import '../../models/profilemodel/profilemodel.dart';

class ProFileServices {
  static String baseurl = 'https://student.valuxapps.com/api/profile';

  static Future<ProFileModel> getdata() async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': token,
      'lang': 'en',
    });
    ProFileModel data = ProFileModel.fromjson(jsonDecode(response.body));
    // print(data.data!.name);
    //print('Token is $token');
    return data;
  }
}
