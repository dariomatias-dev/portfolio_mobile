class LinksModel {
  LinksModel({
    required this.githubRepository,
    required this.officialWebsite,
    this.playground,
  });

  final String githubRepository;
  final String officialWebsite;
  final String? playground;

  factory LinksModel.fromMap(Map<String, dynamic> map) {
    return LinksModel(
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

class ImageNameModel {
  ImageNameModel({
    required this.imageStandard,
    this.imageDarkTheme,
  });

  final String imageStandard;
  final String? imageDarkTheme;

  factory ImageNameModel.fromMap(Map<String, dynamic> map) {
    return ImageNameModel(
      imageStandard: map['image_standard'],
      imageDarkTheme: map['image_dark_theme'],
    );
  }

  toMap() {
    return {
      'imageStandard': imageStandard,
      'imageDarkTheme': imageDarkTheme,
    };
  }
}

class TechnologyModel {
  TechnologyModel({
    required this.name,
    required this.description,
    required this.gradient,
    required this.imageName,
    required this.status,
    required this.createdIn,
    required this.createdBy,
    required this.links,
  });

  final String name;
  final String description;
  final List<String> gradient;
  final ImageNameModel imageName;
  final String status;
  final String createdIn;
  final String createdBy;
  final LinksModel links;

  factory TechnologyModel.fromMap(Map<String, dynamic> map) {
    return TechnologyModel(
      name: map['name'],
      description: map['description'],
      gradient: (map['gradient'] as List<dynamic>).cast<String>(),
      imageName: ImageNameModel.fromMap(map['image_name']),
      status: map['status'],
      createdIn: map['created_in'],
      createdBy: map['created_by'],
      links: LinksModel.fromMap(map['links']),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'gradient': gradient,
      'imageName': imageName.toMap(),
      'status': status,
      'createdIn': createdIn,
      'createdBy': createdBy,
      'links': links.toMap(),
    };
  }
}
