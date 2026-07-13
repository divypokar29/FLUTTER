class Photomodel {
  int? albumId;
  int? id;
  String? title;
  String? url;

  Photomodel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
  });

  factory Photomodel.fromJson(Map<String, dynamic> myjson) {
    return Photomodel(
      albumId: myjson["albumId"],
      id: myjson["id"],
      title: myjson["title"],
      url: myjson["url"],
    );
  }
}
