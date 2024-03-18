import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/data/repositories/NewsRepository.dart';

class DeleteNews {
  final NewsRepository repository;
  DeleteNews(this.repository);

  void call(NewsModel newsModel) {
    repository.deleteNews(newsModel);
  }
}
