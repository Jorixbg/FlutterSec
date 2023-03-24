import 'package:flutter/foundation.dart';

class Comic {
  final String id;
  final int chapter;
  final List<String> categories;
  final String title;
  final String imageUrl;

  const Comic({
    required this.id,
    required this.chapter,
    required this.categories,
    required this.imageUrl,
    required this.title,
  });
}