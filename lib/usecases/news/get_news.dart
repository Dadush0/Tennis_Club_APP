import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/data/repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;
  GetNews(this.repository);

  List<NewsModel> call() {
    return repository.getNews();
  }
}
