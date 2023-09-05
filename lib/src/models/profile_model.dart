class ProfileModel {
  ProfileModel({
    required this.name,
    required this.description,
    required this.email,
    required this.location,
  });

  final String name;
  final String description;
  final String email;
  final String location;

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'],
      description: map['description'],
      email: map['email'],
      location: map['location'],
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'email': email,
      'location': location,
    };
  }
}
