class SearchModel {
  late bool status;
  late SearchData data;
  SearchModel({
    required this.status,
    required this.data,
  });

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = SearchData.fromJson(json['data']);
  }
}

class SearchData {
  late List<Data> data;
  SearchData({
    required this.data,
  });

  SearchData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromjson(e)).toList();
  }
}

class Data {
  late dynamic id;
  late dynamic name;
  late dynamic price;
  late dynamic image;

  Data(this.id, this.name, this.price, this.image);

  Data.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }
}
