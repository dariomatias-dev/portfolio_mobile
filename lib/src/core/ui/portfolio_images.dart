class PortfolioImages {
  static const String _path = 'assets/images';

  static String myPhoto = _getPath('my_photo.png');
  static String logo = _getPath('logo.png');
  static String backgroundImageChair = _getPath('background_image_chair.jpg');
  static String backgroundProfile = _getPath('background_profile.png');

  static String _getPath(String fileName) {
    return '$_path/$fileName';
  }
}
