import 'package:flutter/material.dart';
import 'package:theme_package/theme_package.dart';

class Constants {
  static Brightness brightness = Brightness.dark;
  static const fontSize = 24.0;
  static const containerHeight = 180.0;
  static const containerWidth = 240.0;
  static double get itemExtent => 40.0;
  static Widget text(String caption) => Text(caption,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor.of(brightness: brightness),
      ));

  static Size get dayContainer => Size(containerWidth * 0.25, containerHeight); //50.0
  static Size get yearContainer => Size(containerWidth * 0.40, containerHeight); //80.0
  static Size get monthContainer => Size(containerWidth * 0.35, containerHeight); //70.0
  static Size get hourContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get minuteContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get secondContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get meridianContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get seperatorContainer => Size(containerWidth * 0.083333, containerHeight); //20.0 X2
  static Size get clockContainer => Size(containerWidth, containerHeight);

  static ColorsForTheme primaryColor = ColorsForTheme(light: Color(0xffecf8f8), dark: Color(0xff022c43));
  static ColorsForTheme dateColor = ColorsForTheme(light: Color(0xffeee4e1), dark: Color(0xff115173));
  static ColorsForTheme timeColor = ColorsForTheme(light: Color(0xffe6beae), dark: Color(0xff053f5e));
  static ColorsForTheme textColor = ColorsForTheme(light: Colors.black87, dark: Colors.tealAccent);
}
