import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopapp/conestants/const.dart';
import '../models/changefavoritemodel/changefavoritemodel.dart';

class ChangeFavoritesServices {
  static String baseurl = 'https://student.valuxapps.com/api/favorites';

  static Future<ChangeFavoriteModel> postdata({
    required int productid,
  }) async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.post(url, body: {
      'Content-Type': 'application/json',
      'product_id': '$productid',
    }, headers: {
      'Authorization': token,
      'lang': 'en',
    });
    ChangeFavoriteModel data =
        ChangeFavoriteModel.fromjson(jsonDecode(response.body));
    print(data.status);
    return data;
  }
}
