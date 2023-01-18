import 'dart:convert';

import 'package:http/http.dart' as http;
import '../conestants/const.dart';
import '../models/favoritemodel/favoritemodel.dart';

class FavoriteServices {
  static String baseurl = 'https://student.valuxapps.com/api/favorites';

  static Future<FavoriteModel> getdata() async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.get(url, headers: {
      'Authorization': token,
      'lang': 'en',
    });
    FavoriteModel favoriteModel =
        FavoriteModel.fromJson(jsonDecode(response.body));
    print(favoriteModel.data!.data![0].product!.name);
    //print('Token is $token');
    return favoriteModel;
  }
}
