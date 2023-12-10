class NewsListModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? publishedAt;
  String? content;
  String? urlToImage;

  NewsListModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.publishedAt,
      this.content,
      this.urlToImage});

  NewsListModel.fromJson(Map<String, dynamic> json) {
    source = json["source"] == null ? null : Source.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    publishedAt = json["publishedAt"];
    content = json["content"];
    urlToImage = json["urlToImage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (source != null) {
      _data["source"] = source?.toJson();
    }
    _data["author"] = author;
    _data["title"] = title;
    _data["description"] = description;
    _data["url"] = url;
    _data["publishedAt"] = publishedAt;
    _data["content"] = content;
    _data["urlToImage"] = urlToImage;
    return _data;
  }

  static List getProductList(List result){
      return result.map((e) => NewsListModel.fromJson(e)).toList();
    }
}

class Source {
  dynamic id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }

}
