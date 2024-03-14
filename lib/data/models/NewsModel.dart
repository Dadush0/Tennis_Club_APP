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

  NewsModel.empty() {
    title = '';
    shortText = '';
    content = '';
    date = DateTime.now();
    preview = 'assets/images/tenniscamp23.png'; // TODO: Add blank image
  }
}
