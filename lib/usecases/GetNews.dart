import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/data/repositories/NewsRepository.dart';

class GetNews {
  final NewsRepository repository;
  GetNews(this.repository);

  List<NewsModel> call() {
    return repository.getNews();
  }
}
