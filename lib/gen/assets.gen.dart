// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_arrow_back.svg
  String get icArrowBack => 'assets/icons/ic_arrow_back.svg';

  /// File path: assets/icons/ic_cart.svg
  String get icCart => 'assets/icons/ic_cart.svg';

  /// File path: assets/icons/ic_heart.svg
  String get icHeart => 'assets/icons/ic_heart.svg';

  /// File path: assets/icons/ic_heart_fill.svg
  String get icHeartFill => 'assets/icons/ic_heart_fill.svg';

  /// File path: assets/icons/ic_home.svg
  String get icHome => 'assets/icons/ic_home.svg';

  /// File path: assets/icons/ic_message.svg
  String get icMessage => 'assets/icons/ic_message.svg';

  /// File path: assets/icons/ic_profile.svg
  String get icProfile => 'assets/icons/ic_profile.svg';

  /// File path: assets/icons/ic_star.svg
  String get icStar => 'assets/icons/ic_star.svg';

  /// File path: assets/icons/order.svg
  String get order => 'assets/icons/order.svg';

  /// File path: assets/icons/serach_icon.svg
  String get serachIcon => 'assets/icons/serach_icon.svg';

  /// List of all assets
  List<String> get values => [
    icArrowBack,
    icCart,
    icHeart,
    icHeartFill,
    icHome,
    icMessage,
    icProfile,
    icStar,
    order,
    serachIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_class.svg
  String get imgClass => 'assets/images/img_class.svg';

  /// File path: assets/images/img_parents.svg
  String get imgParents => 'assets/images/img_parents.svg';

  /// File path: assets/images/img_placeholder.svg
  String get imgPlaceholder => 'assets/images/img_placeholder.svg';

  /// File path: assets/images/img_star.svg
  String get imgStar => 'assets/images/img_star.svg';

  /// File path: assets/images/img_student.svg
  String get imgStudent => 'assets/images/img_student.svg';

  /// File path: assets/images/img_teacher.svg
  String get imgTeacher => 'assets/images/img_teacher.svg';

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/teacher_student.svg
  String get teacherStudent => 'assets/images/teacher_student.svg';

  /// List of all assets
  List<dynamic> get values => [
    imgClass,
    imgParents,
    imgPlaceholder,
    imgStar,
    imgStudent,
    imgTeacher,
    splash,
    teacherStudent,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
