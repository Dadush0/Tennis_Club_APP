class NewsModel {
  late String title;
  late String shortText;
  late String content;
  late DateTime date;
  late DateTime releaseDate;
  late String preview;
  late List<String> images;

  NewsModel(
      {required this.title,
      required this.shortText,
      required this.content,
      required this.date,
      required this.preview,
      this.images = const []}) {
    releaseDate = DateTime.now();
  }
}
