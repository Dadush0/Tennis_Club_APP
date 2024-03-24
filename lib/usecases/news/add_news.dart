import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/data/repositories/news_repository.dart';

class AddNews {
  final NewsRepository repository;
  AddNews(this.repository);

  void call(NewsModel newsModel) {
    repository.addNews(newsModel);
  }
}
