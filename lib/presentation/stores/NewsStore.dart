import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/usecases/GetNews.dart';

part 'NewsStore.g.dart';

// TODO: consider private or public see MainStore
// ignore: library_private_types_in_public_api
class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  final GetNews _getNews = locator<GetNews>();

  @observable
  ObservableList<NewsModel> newsModel = <NewsModel>[].asObservable();

  @action
  Future<void> getNews() async {
    newsModel.addAll(_getNews.call());
  }
}
