class SocialMediaModel {
  SocialMediaModel({
    required this.link,
    required this.name,
  });

  final String name;
  final String link;

  factory SocialMediaModel.fromMap(Map<String, dynamic> map) {
    return SocialMediaModel(
      link: map['link'],
      name: map['name'],
    );
  }

  toMap() {
    return {
      'link': link,
      'name': name,
    };
  }
}
