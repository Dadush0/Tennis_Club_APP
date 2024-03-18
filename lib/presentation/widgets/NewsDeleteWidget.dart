import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/NewsStore.dart';

class NewsDeleteWidget extends StatelessWidget {
  NewsDeleteWidget({super.key, required this.newsModel});
  final NewsStore _newsStore = locator<NewsStore>();
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: null,
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text('Yes'),
                  onPressed: () {
                    _newsStore.deleteNews(newsModel);
                    _newsStore.getNews();
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
