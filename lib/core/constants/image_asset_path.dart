class ImageAssetPath {
  ImageAssetPath._();

  static String _getPath(String fileName) {
    return 'assets/images/$fileName';
  }

  static String get disconnected => _getPath('disconnected.png');

  static String get monkey => _getPath('monkey.png');

  static String get authentication => _getPath('authentication.png');

  static String get spending => _getPath('spending.png');

  static String get emptyBox => _getPath('empty_box.png');

  static String get syncFolder => _getPath('sync_folder.png');

  static String get hourglass => _getPath('hourglass.png');
}
