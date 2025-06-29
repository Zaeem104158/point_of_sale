class LinkModel {
  final String rel;
  final String href;

  LinkModel({required this.rel, required this.href});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      rel: json['rel'],
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() => {
        'rel': rel,
        'href': href,
      };
}
