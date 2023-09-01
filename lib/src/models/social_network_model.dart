class SocialNetworkModel {
  SocialNetworkModel({
    required this.link,
    required this.name,
  });

  final String name;
  final String link;

  factory SocialNetworkModel.fromMap(Map<String, dynamic> map) {
    return SocialNetworkModel(
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
