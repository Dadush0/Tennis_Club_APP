import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/usecases/AddNews.dart';
import 'package:tennis_club_app/usecases/GetNews.dart';

part 'NewsStore.g.dart';

// TODO: consider private or public see MainStore
// ignore: library_private_types_in_public_api
class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  final GetNews _getNews = locator<GetNews>();
  final AddNews _addNews = locator<AddNews>();

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

  void resetNews() {
    newNews = Observable(NewsModel.empty());
  }
}
