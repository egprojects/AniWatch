import 'package:anitube/core/models/anime.dart';
import 'package:anitube/core/services/anime_service.dart';
import 'package:flutter/foundation.dart';
import 'package:injector/injector.dart';

class AnimeCatalogModel {
  final _service = Injector.appInstance.getDependency<AnimeService>();
  final _items = <AnimeTileModel>[];
  var _page = 0;
  var _lastLoaded = -1;
  var _lastRequested = -1;

  AnimeCatalogModel() {
    _loadNext();
  }

  AnimeTileModel getAnime(int index) {
    _lastRequested = index;
    if (index == _items.length) {
      _prepareNewTileModel();
    } else if (index == _lastLoaded - 6) {
      _loadNext();
    }

    return _items[index];
  }

  void _prepareNewTileModel() {
    _items.add(AnimeTileModel());
  }

  void _loadNext() {
    _service.getAnimePreviews(++_page).listen((anime) {
      if (++_lastLoaded >= _items.length) _prepareNewTileModel();
      _items[_lastLoaded].anime = anime;
    }).onDone(() {
      if (_lastRequested >= _lastLoaded - 6) _loadNext();
    });
  }
}

class AnimeTileModel extends ChangeNotifier {
  String title;
  String posterUrl;
  String lastEpisodeName;
  String rating;

  AnimeTileModel()
      : title = 'Загрузка',
        lastEpisodeName = 'Загрузка';

  bool get isLoaded => posterUrl != null;

  bool get hasLastEpisodeData => lastEpisodeName != null;

  set anime(Anime anime) {
    title = anime.title;
    posterUrl = anime.posterUrl;
    lastEpisodeName =
        anime.lastEpisode == null ? null : '${anime.lastEpisode} эп.';
    rating = anime.rating.toString();
    notifyListeners();
  }
}
