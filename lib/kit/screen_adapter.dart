import 'package:flutter/material.dart';
import 'dart:ui';


/**
 * 屏幕适配方案,根据给定的设计稿尺寸,获取想要的真实像素
 * ```
 * Adapt.init(1920,1080);
 *
 * Adapt.w(10);
 * Adapt.f(10,scale = false); //字体不随着系统变化而变化
 *
 * ```
 *
 */
class Adapt {

  static final int DEFALUT_WIDTH = 1920;
  static final int DEFALUT_HEIGHT = 1080;
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _paddingTop = mediaQuery.padding.top;
  static double _paddingBottom = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;
  static double _scaleRatio = mediaQuery.textScaleFactor;


  static var _ratioWidth;
  static var _ratioHeight;

  ///初始化
  static init(int width, int height) {
    _ratioWidth = _width / width;
    _ratioHeight = _height / height;
  }


  ///宽
  static w(size) {
    isInit();
    return size * _ratioWidth;
  }

  ///高
  static h(size) {
    isInit();
    return size * _ratioHeight;
  }

  ///一像素
  static onePx() {
    return 1 / _pixelRatio;
  }

  ///屏幕宽度
  static screenW() {
    return _width;
  }

  ///屏幕高度
  static screenH() {
    return _height;
  }

  ///字体大小
  static f(size, {bool scale = true}) {
    if (scale) {
      return size;
    } else {
      return size / _scaleRatio;
    }
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