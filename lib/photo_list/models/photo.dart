enum PaperType { glossy, matte }

class Photo {
  final String path;
  int quantity = 1;
  String format = "9x13";
  PaperType paperType = PaperType.glossy;
  bool isBlackAndWhite = false;

  Photo(this.path);
}
