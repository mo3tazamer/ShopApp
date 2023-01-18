class ChangeFavoriteModel {
  late bool status;
  late String message;

  ChangeFavoriteModel(this.status, this.message);

  ChangeFavoriteModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
