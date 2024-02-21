import 'package:flutter/foundation.dart';

extension AssetPathExtension on String {
  String get platformAsset {
    final uri = Uri.parse(this);
    if (kIsWeb) {
      final segment = [...uri.pathSegments];
      segment.removeAt(0);
      return segment.join('/');
    }
    return this;
  }
}
