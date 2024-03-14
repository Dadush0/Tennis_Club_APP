import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/data/repositories/NewsRepository.dart';

class AddNews {
  final NewsRepository repository;
  AddNews(this.repository);

  void call(NewsModel newsModel) {
    repository.addNews(newsModel);
  }
}
