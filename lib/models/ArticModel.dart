class ArticlesModel {
  String? message;
  List<ArticlesData> ariclesData = [];

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    message = json["Message"];
    if (json["articles"] != null) {
      json["articles"].forEach((art) {
        ariclesData.add(art);
      });
    }
  }
}

class ArticlesData {
  String ? id;
  String ? catagory;
  String ? title;
  String ? desc;
  String ? pic;


  ArticlesData.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    catagory = json["catagory"];
    title = json["title"];
    desc = json["desc"];
    pic = json["pic"];

  }
}
