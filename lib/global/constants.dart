class Configurations {
  Configurations._();

  static const int connect_time_out = 10000;
  static const int receive_time_out = 10000;
  static const String base_url = "";

  ///设计稿宽高像素
  static const int design_width_px = 1080;
  static const int design_height_px = 1920;

  ///设计稿像素密度（一般6s）
  static const int design_density = 3;

  ///适配宽or高
  static const bool fitWidth = true;

  ///是否应用系统字体缩放
  static const bool applySystemFontScaling = true;
}

class Iro {
  ///gray
  static const int gray1 = 0xffE1E1E1;
  static const int gray2 = 0xffF7F7F7;
  static const int gray3 = 0xff999999;
  
  //blue
  static const int blue1 = 0xff007FFF;

  static const int textColor1 = 0xff111111;
}
