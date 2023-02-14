/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/dark_icon.png
  AssetGenImage get darkIcon =>
      const AssetGenImage('assets/icons/dark_icon.png');

  $AssetsIconsLauncherGen get launcher => const $AssetsIconsLauncherGen();

  /// File path: assets/icons/light_icon.png
  AssetGenImage get lightIcon =>
      const AssetGenImage('assets/icons/light_icon.png');

  /// File path: assets/icons/previous_done.png
  AssetGenImage get previousDone =>
      const AssetGenImage('assets/icons/previous_done.png');

  /// List of all assets
  List<AssetGenImage> get values => [darkIcon, lightIcon, previousDone];
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en_US.json
  String get enUS => 'assets/locales/en_US.json';

  /// File path: assets/locales/pt_PT.json
  String get ptPT => 'assets/locales/pt_PT.json';

  /// List of all assets
  List<String> get values => [enUS, ptPT];
}

class $AssetsIconsLauncherGen {
  const $AssetsIconsLauncherGen();

  /// File path: assets/icons/launcher/from_suwayomi.png
  AssetGenImage get fromSuwayomi =>
      const AssetGenImage('assets/icons/launcher/from_suwayomi.png');

  /// File path: assets/icons/launcher/sorayomi_icon.ico
  String get sorayomiIconIco => 'assets/icons/launcher/sorayomi_icon.ico';

  /// File path: assets/icons/launcher/sorayomi_icon.png
  AssetGenImage get sorayomiIconPng =>
      const AssetGenImage('assets/icons/launcher/sorayomi_icon.png');

  /// File path: assets/icons/launcher/sorayomi_preview_icon.png
  AssetGenImage get sorayomiPreviewIcon =>
      const AssetGenImage('assets/icons/launcher/sorayomi_preview_icon.png');

  /// List of all assets
  List<dynamic> get values =>
      [fromSuwayomi, sorayomiIconIco, sorayomiIconPng, sorayomiPreviewIcon];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
