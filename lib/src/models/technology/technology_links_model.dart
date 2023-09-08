class TechnologyLinksModel {
  TechnologyLinksModel({
    required this.githubRepository,
    required this.officialWebsite,
    this.playground,
  });

  final String githubRepository;
  final String officialWebsite;
  final String? playground;

  factory TechnologyLinksModel.fromMap(Map<String, dynamic> map) {
    return TechnologyLinksModel(
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
