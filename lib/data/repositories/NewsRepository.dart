import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/data/models/DataModel.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';

class NewsRepository {
  NewsRepository();

  List<NewsModel> getNews() {
    List<NewsModel> newsModel = DataModel.news;
    newsModel.sort(sortNewsByDate);
    return newsModel;
  }

  void addNews(NewsModel newsModel) {
    DataModel.news.add(newsModel);
    FirebaseConnection.writeNewsData();
  }

  void deleteNews(NewsModel newsModel) {
    DataModel.news.remove(newsModel);
    FirebaseConnection.writeNewsData();
  }

  int sortNewsByDate(NewsModel a, NewsModel b) {
    return a.date.compareTo(b.date) * (-1); // Desc
  }
}
