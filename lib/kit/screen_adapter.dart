import 'package:flutter/material.dart';
import 'dart:ui';

class Adapt {

  static final int DEFALUT_WIDTH = 1920;
  static final int DEFALUT_HEIGHT = 1080;
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _paddingTop = mediaQuery.padding.top;
  static double _paddingBottom = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;

  static var _ratioWidth;
  static var _ratioHeight;

  static init(int width, int height) {
    _ratioWidth = _width / width;
    _ratioHeight = _height / height;
  }


  static w(size) {
    isInit();
    return size * _ratioWidth;
  }

  static h(size) {
    isInit();
    return size * _ratioHeight;
  }

  static onePx() {
    return 1 / _pixelRatio;
  }

  static screenW() {
    return _width;
  }

  static screenH() {
    return _height;
  }

  static paddingTop() {
    return _paddingTop;
  }

  static paddintBottom() {
    return _paddingBottom;
  }


  static isInit() {
    if (!(_ratioWidth is int || _ratioWidth is double)) {
      init(DEFALUT_WIDTH, DEFALUT_HEIGHT);
    }
  }


}