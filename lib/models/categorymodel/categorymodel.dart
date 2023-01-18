class CategoryModel {
  late final bool status;
  late final Data data;
  CategoryModel({
    required this.status,
    required this.data,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<CatData> data;
  Data({
    required this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => CatData.fromJson(e)).toList();
  }
}

class CatData {
  late String name;
  late String image;

  CatData(this.name, this.image);

  CatData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }
}

//data = List.from(json['data']).map((e)=>CatData.fromJson(e)).cast<Data>().toList();
