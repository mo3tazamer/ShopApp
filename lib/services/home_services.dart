import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopapp/models/homemodel/homemodel.dart';

import '../conestants/const.dart';

class HomeServices {
  static String baseurl = 'https://student.valuxapps.com/api/home';

  static Future<HomeModel> getdata() async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': '$token',
      'lang': 'en',
    });
    HomeModel data = HomeModel.fromJson(jsonDecode(response.body));
    print(data.data.banners[0].image);
    print('Token is $token');
    return data;
  }
}
