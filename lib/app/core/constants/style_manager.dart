
import 'package:flutter/material.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyle(double fontSize,FontWeight fontWeight,Color color){
  return TextStyle(
    fontFamily: FontsConstants.fontFamily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}
// Regular Style
TextStyle getRegularStyle({
  double fontSize = FontSize.s14,
  required Color color,
}){
  return _getTextStyle(fontSize, FontsWeightManager.regular, color);
}
// Medium Style
TextStyle getMediumStyle({
  double fontSize = FontSize.s14,
  required Color color,
}){
  return _getTextStyle(fontSize, FontsWeightManager.medium, color);
}
// Regular Style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s14,
  required Color color,
}){
  return _getTextStyle(fontSize, FontsWeightManager.semiBold, color);
}
TextStyle getBoldStyle({
  double fontSize = FontSize.s14,
  required Color color,
}){
  return _getTextStyle(fontSize, FontsWeightManager.bold, color);
}