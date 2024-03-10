class ImageAssetPath {
  ImageAssetPath._();

  static String _getPath(String fileName) {
    return 'assets/images/$fileName';
  }

  static String get disconnected => _getPath('disconnected.png');

  static String get monkey => _getPath('monkey.png');

  static String get authentication => _getPath('authentication.png');
}
