class PortfolioImages {
  static const String _path = 'assets/images';

  static String logo = _getPath('logo.png');
  static String backgroundImageChair = _getPath('background_image_chair.jpg');

  static String _getPath(String fileName) {
    return '$_path/$fileName';
  }
}
