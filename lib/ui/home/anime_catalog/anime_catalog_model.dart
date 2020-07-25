import 'package:aniwatch/core/models/anime.dart';
import 'package:aniwatch/core/services/anime_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injector/injector.dart';

class AnimeCatalogModel extends ChangeNotifier {
  final _service = Injector.appInstance.getDependency<AnimeService>();
  final _data = <Anime>[];
  int _currentPage = 0;

  int get itemCount => _data.length;

  AnimeCatalogModel() {
    _loadNext();
  }

  Anime getAnime(int index) {
    if (index == _data.length - 5) _loadNext();
    return _data.length > index ? _data[index] : null;
  }

  void _loadNext() {
    _service.getAnimeList(++_currentPage).then((newData) {
      _data.addAll(newData);
      notifyListeners();
    });
  }
}
