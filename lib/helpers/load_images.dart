import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<String>> loadImages() async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  final imagePaths = manifestMap.keys
      .where((String key) => key.contains('assets/apes/'))
      .toList();
  return imagePaths;
}