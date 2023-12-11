class Article {
  final int id;
  final String title;
  final String photo;
  final String detail;
  final String url;

  Article({
    required this.id,
    required this.title,
    required this.photo,
    required this.detail,
    this.url = 'http://google.com',
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    Uri uri = Uri.parse(json['detail']);
    String host = uri.host;
    return Article(
      id: json['id'],
      title: json['title'],
      photo: json['photoEvent'],
      detail: host.toString(),
      url: json['detail'],
    );
  }
}

class UpdateArticleModel {
  final String id;
  final String title;
  final String? photo;
  final String detail;

  UpdateArticleModel({
    required this.id,
    required this.title,
    this.photo,
    required this.detail,
  });
}
