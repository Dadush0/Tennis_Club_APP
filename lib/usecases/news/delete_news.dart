import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/data/repositories/news_repository.dart';

class DeleteNews {
  final NewsRepository repository;
  DeleteNews(this.repository);

  void call(NewsModel newsModel) {
    repository.deleteNews(newsModel);
  }
}
