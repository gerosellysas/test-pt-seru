class Images {
  static _pngPath(String image) => "assets/images/$image.png";
  static _svgPath(String image) => "assets/images/$image.svg";

  static String logo = _pngPath("logo");
  static String back = _svgPath("back");
  static String clear = _svgPath("clear");
}
