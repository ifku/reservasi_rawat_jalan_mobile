// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "hello": "Hello world!",
  "greeting": "Welcome from US"
};
static const Map<String,dynamic> id_ID = {
  "hello": "Halo dunia!",
  "greeting": "Halo dari Indonesia"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "id_ID": id_ID};
}
