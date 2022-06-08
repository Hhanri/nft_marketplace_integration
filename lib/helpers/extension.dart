extension FilterFileName on String {
  String getFileName() {
    return split('/').last.replaceAll('.png', '');
  }
}