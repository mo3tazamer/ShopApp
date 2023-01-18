import 'dart:convert';
import 'package:http/http.dart' as http;
import '../conestants/const.dart';
import '../models/categorymodel/categorymodel.dart';

class CategoryServices {
  static String baseurl = 'https://student.valuxapps.com/api/categories';
  static Future<CategoryModel> getdata() async {
    Uri url = Uri.parse(baseurl);
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'lang': 'en',
    });
    CategoryModel categoryModel =
        CategoryModel.fromJson(jsonDecode(response.body));
    print(categoryModel.data.data[0].name);

    return categoryModel;
  }
}
