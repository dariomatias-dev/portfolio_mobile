class TechnologyReferencesModel {
  TechnologyReferencesModel({
    required this.githubRepository,
    required this.officialWebsite,
    this.playground,
  });

  final String githubRepository;
  final String officialWebsite;
  final String? playground;

  factory TechnologyReferencesModel.fromMap(Map<String, dynamic> map) {
    return TechnologyReferencesModel(
      githubRepository: map['github_repository'],
      officialWebsite: map['official_website'],
      playground: map['playground'],
    );
  }

  toMap() {
    return {
      'githubRepository': githubRepository,
      'officialWebsite': officialWebsite,
      'playground': playground,
    };
  }
}
