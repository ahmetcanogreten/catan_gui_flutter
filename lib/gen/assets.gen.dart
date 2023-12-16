/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/catan_background.jpg
  AssetGenImage get catanBackground =>
      const AssetGenImage('assets/images/catan_background.jpg');

  /// File path: assets/images/desert.png
  AssetGenImage get desert => const AssetGenImage('assets/images/desert.png');

  /// File path: assets/images/dice.png
  AssetGenImage get dice => const AssetGenImage('assets/images/dice.png');

  /// File path: assets/images/fields.png
  AssetGenImage get fields => const AssetGenImage('assets/images/fields.png');

  /// File path: assets/images/fields_grain.png
  AssetGenImage get fieldsGrain =>
      const AssetGenImage('assets/images/fields_grain.png');

  /// File path: assets/images/forest.png
  AssetGenImage get forest => const AssetGenImage('assets/images/forest.png');

  /// File path: assets/images/forest_lumber.png
  AssetGenImage get forestLumber =>
      const AssetGenImage('assets/images/forest_lumber.png');

  /// File path: assets/images/hills.png
  AssetGenImage get hills => const AssetGenImage('assets/images/hills.png');

  /// File path: assets/images/hills_brick.png
  AssetGenImage get hillsBrick =>
      const AssetGenImage('assets/images/hills_brick.png');

  /// File path: assets/images/mountains.png
  AssetGenImage get mountains =>
      const AssetGenImage('assets/images/mountains.png');

  /// File path: assets/images/mountains_ore.png
  AssetGenImage get mountainsOre =>
      const AssetGenImage('assets/images/mountains_ore.png');

  /// File path: assets/images/pasture.png
  AssetGenImage get pasture => const AssetGenImage('assets/images/pasture.png');

  /// File path: assets/images/pasture_wool.png
  AssetGenImage get pastureWool =>
      const AssetGenImage('assets/images/pasture_wool.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        catanBackground,
        desert,
        dice,
        fields,
        fieldsGrain,
        forest,
        forestLumber,
        hills,
        hillsBrick,
        mountains,
        mountainsOre,
        pasture,
        pastureWool
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
