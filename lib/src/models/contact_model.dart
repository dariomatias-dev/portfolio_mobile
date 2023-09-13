class ContactModel {
  ContactModel({
    required this.link,
    required this.name,
  });

  final String name;
  final String link;

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
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
