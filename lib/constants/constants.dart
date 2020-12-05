import 'package:flutter/material.dart';

class Constants {
  static const fontSize = 24.0;
  static const containerHeight = 180.0;
  static const containerWidth = 240.0;
  static double get itemExtent => 40.0;
  static Widget text(String caption) => Text(caption, style: const TextStyle(fontSize: fontSize));
  static Size get dayContainer => Size(containerWidth * 0.25, containerHeight); //50.0
  static Size get yearContainer => Size(containerWidth * 0.40, containerHeight); //80.0
  static Size get monthContainer => Size(containerWidth * 0.35, containerHeight); //70.0
  static Size get hourContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get minuteContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get secondContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get meridianContainer => Size(containerWidth * 0.2083333, containerHeight); //50.0
  static Size get seperatorContainer => Size(containerWidth * 0.083333, containerHeight); //20.0 X2
  static Size get clockContainer => Size(containerWidth, containerHeight);
}
