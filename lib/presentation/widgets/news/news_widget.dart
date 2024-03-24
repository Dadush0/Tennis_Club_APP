import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/news_store.dart';
import 'package:tennis_club_app/presentation/widgets/news/news_card_widget.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({super.key});
  final NewsStore _newsStore = locator<NewsStore>();

  List<NewsCardWidget> convertNewsToWidgets() {
    List<NewsCardWidget> widgets = [];
    for (var news in _newsStore.newsModel) {
      widgets.add(NewsCardWidget(newsModel: news));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Observer(
            builder: (_) => Column(
                  children: convertNewsToWidgets(),
                )),
      ),
    );
  }
}
