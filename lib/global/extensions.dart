import 'dart:ui';
import '../utils/ui_utils.dart';
import 'constants.dart';

extension IntExt on int{
  ///px转dp
  double get px =>
    Configurations.fitWidth ?
    this * (window.physicalSize.width / Configurations.design_width_px) //先缩放（1080下就是x1.44）
      / window.devicePixelRatio// 除以本机像素密度获取dp
    :
    this * (window.physicalSize.height / Configurations.design_height_px)
      / window.devicePixelRatio;

  ///根据像素密度比转换dp
  double get dp =>
    Configurations.fitWidth ?
    (this * Configurations.design_density) * //获取到设计图px
      (window.physicalSize.width / Configurations.design_width_px)// 乘以缩放因子
      / window.devicePixelRatio //除以本机像素密度获取dp
    :
    (this * Configurations.design_density) *
      (window.physicalSize.height / Configurations.design_height_px) /
      window.devicePixelRatio;

  ///字体专用单位 可控制缩放
  double get sp {
    if (Configurations.fitWidth) {
      if (Configurations.applySystemFontScaling) {
        return (this * Configurations.design_density) //获取到设计图px
          * (window.physicalSize.width
            / Configurations.design_width_px) // 乘以缩放因子
          / window.devicePixelRatio; //除以本机像素密度获取dp
      } else {
        return (this * Configurations.design_density) //获取到设计图px
          * (window.physicalSize.width
            / Configurations.design_width_px) / // 乘以缩放因子
          window.devicePixelRatio //除以本机像素密度获取dp
          / UIUtils.textScaleFactor; //除以系统字体缩放因子，放大多少就缩小多少233
      }
    } else {
      if (Configurations.applySystemFontScaling) {
        return (this * Configurations.design_density)
          * (window.physicalSize.height
            / Configurations.design_height_px)
          / window.devicePixelRatio;
      } else {
        return (this * Configurations.design_density)
          * (window.physicalSize.height
            / Configurations.design_height_px)
          / window.devicePixelRatio
          / UIUtils.textScaleFactor;
      }
    }
  }
}