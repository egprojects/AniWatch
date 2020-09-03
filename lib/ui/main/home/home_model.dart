import 'dart:collection';

import 'package:anitube/core/models/anime.dart';
import 'package:flutter/foundation.dart';

class HomeModel extends ChangeNotifier {
  final _lastUpdated = [
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
    Anime('', 'Bleach', 'https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', 9, 8.69),
  ];
  final _films = [];
  final _history = [];
  final _plans = [];
  final _categories = [];

  List<Anime> get lastUpdated => UnmodifiableListView(_lastUpdated);
}