import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopapp/conestants/const.dart';
import 'package:shopapp/models/loginmodel/loginmodel.dart';

import '../models/searchmodel/searchmodel.dart';

class SearchServices {
  static String baseurl = 'https://student.valuxapps.com/api/products/search';

  static Future<SearchModel> postdata({
    required String text,
  }) async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.post(url, body: {
      'text': text,
    }, headers: {
      'lang': 'en',
      'Authorization': token,
    });
    SearchModel searchModel = SearchModel.fromJson(jsonDecode(response.body));
    print(searchModel.data.data[0].id);
    return searchModel;
  }
}
