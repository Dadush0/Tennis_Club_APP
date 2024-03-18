import 'package:tennis_club_app/data/datasources/dataStubNews.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';

class NewsRepository {
  final DataStubNews data;

  NewsRepository({
    required this.data,
  });

  List<NewsModel> getNews() {
    List<NewsModel> newsModel = data.getNews();
    newsModel.sort(sortNewsByDate);
    return newsModel;
  }

  void addNews(NewsModel newsModel) {
    data.addNews(newsModel);
  }

  void deleteNews(NewsModel newsModel) {
    data.deleteNews(newsModel);
  }

  int sortNewsByDate(NewsModel a, NewsModel b) {
    return a.date.compareTo(b.date) * (-1); // Desc
  }
}
