import 'package:flutter/material.dart';

class Responsive {
  late Responsive _initResponsive;

  static late BuildContext _context;

  static late double _referenceWidth;
  static late double _referenceHeight;

  static late double _screenWidth;
  static late double _screenHeight;

  factory Responsive(BuildContext context, double referenceWidth, double referenceHeight) =>
      Responsive._internal(context, referenceWidth, referenceHeight);

  Responsive._internal(BuildContext context, double referenceWidth, double referenceHeight) {
    _context = context;
    _referenceWidth = referenceWidth;
    _referenceHeight = referenceHeight;
    _setAttributes();
    _init();
  }

  void _init() async => _initResponsive = this;

  static Responsive init(BuildContext context, {double referenceWidth = 1080, double referenceHeight = 1920}) {
    WidgetsFlutterBinding.ensureInitialized();
    return Responsive(context, referenceWidth, referenceHeight)._initResponsive;
  }

  void _setAttributes() {
    final physicalSize = MediaQuery.of(_context).size;

    _screenWidth = physicalSize.width;
    _screenHeight = physicalSize.height;
  }

  static double _getResponsiveSize(double size, {required bool isWidth}) {
    final referenceSize = isWidth ? _referenceWidth : _referenceHeight;
    final screenSize = isWidth ? _screenWidth : _screenHeight;

    final referenceAspectRatio = _referenceWidth / _referenceHeight;
    final screenAspectRatio = _screenWidth / _screenHeight;

    if (screenAspectRatio > referenceAspectRatio && _screenHeight > _referenceHeight) {
      final widthRatio = _screenWidth / _referenceWidth;
      final heightRatio = _screenHeight / _referenceHeight;

      return size * (widthRatio < heightRatio ? widthRatio : heightRatio);
    }

    if (screenAspectRatio > referenceAspectRatio) return size * (screenSize / referenceSize) * (referenceAspectRatio / screenAspectRatio);
    if (screenAspectRatio < referenceAspectRatio) return size * (screenSize / referenceSize) * (screenAspectRatio / referenceAspectRatio);

    return size * (screenSize / referenceSize);
  }

  static double w(double size) => _getResponsiveSize(size, isWidth: true);
  static double h(double size) => _getResponsiveSize(size, isWidth: false);

  static double get wp => _screenWidth;
  static double get hp => _screenHeight;
}

extension ResponsiveSize on num {
  double get h => Responsive.h(toDouble());
  double get w => Responsive.w(toDouble());

  double get hp => Responsive.hp;
  double get wp => Responsive.wp;
}
