import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/usecases/add_news.dart';
import 'package:tennis_club_app/usecases/get_news.dart';
import 'package:tennis_club_app/usecases/delete_news.dart';

// ignore: library_private_types_in_public_api
//class TemplateStore = _TemplateStore with _$TemplateStore;

abstract class _TemplateStore with Store {
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
