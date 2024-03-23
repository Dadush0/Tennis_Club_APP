import 'package:tennis_club_app/data/models/data_model.dart';
import 'package:tennis_club_app/data/models/model.dart';

class NewsModel extends Model {
  late String title;
  late String shortText;
  late String content;
  late DateTime date;
  late DateTime releaseDate;
  late String preview;
  late List<String> images;

  @override
  NewsModel(
      {required this.title,
      required this.shortText,
      required this.content,
      required this.date,
      required this.preview,
      this.images = const []}) {
    releaseDate = DateTime.now();
  }

  @override
  NewsModel.empty() {
    title = '';
    shortText = '';
    content = '';
    date = DateTime.now();
    releaseDate = DateTime.now();
    preview = 'tenniscamp23.png';
  }

  static Map<String, dynamic> serializeNews() {
    Map<String, dynamic> news = {};
    Map<String, dynamic> newsList = {};
    int index = 1;
    for (var element in DataModel.news) {
      news = {
        "title": element.title,
        "shortText": element.shortText,
        "content": element.content,
        "imagePath": element.preview,
        "date": element.date.toString(),
        "releaseDate": element.releaseDate.toString(),
      };
      newsList.putIfAbsent("n$index", () => news);
      index++;
    }
    return newsList;
  }

  static void deserializeNews(Map news) {
    news.forEach((key, value) async {
      NewsModel newsModel = NewsModel(
          title: value['title'],
          shortText: value['shortText'],
          content: value['content'],
          date: DateTime.parse(value['date']),
          preview: value['imagePath']);
      newsModel.releaseDate = DateTime.parse(value['releaseDate']);
      DataModel.news.add(newsModel);
    });
  }
}
