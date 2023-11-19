import 'package:tennis_club_app/data/datasources/dataStubNews.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';

class NewsRepository {
  final DataStubNews data;

  NewsRepository({
    required this.data,
  });

  List<NewsModel> getNews() {
    return data.getNews();
  }
}
