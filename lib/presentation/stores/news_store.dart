import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/usecases/news/add_news.dart';
import 'package:tennis_club_app/usecases/news/get_news.dart';
import 'package:tennis_club_app/usecases/news/delete_news.dart';

part 'news_store.g.dart';

// ignore: library_private_types_in_public_api
class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  final GetNews _getNews = locator<GetNews>();
  final AddNews _addNews = locator<AddNews>();
  final DeleteNews _deleteNews = locator<DeleteNews>();

  @observable
  ObservableList<NewsModel> newsModel = <NewsModel>[].asObservable();

  @observable
  Observable<NewsModel> newNews = Observable(NewsModel.empty());

  @action
  void setNews(NewsModel newsModel) {
    newNews = Observable(newsModel);
  }

  @action
  Future<void> getNews() async {
    newsModel.clear();
    newsModel.addAll(_getNews.call());
  }

  void addNews() {
    _addNews.call(newNews.value);
  }

  void deleteNews(NewsModel newsModel) {
    _deleteNews.call(newsModel);
  }

  void resetNews() {
    newNews = Observable(NewsModel.empty());
  }
}
