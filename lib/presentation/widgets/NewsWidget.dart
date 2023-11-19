import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/NewsStore.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({super.key});
  final NewsStore _newsStore = locator<NewsStore>();
  late NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    _newsStore.getNews();
    newsModel = _newsStore.newsModel.first;
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 360,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                child: Semantics(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 184,
                        width: double.infinity,
                        child: Image.asset(newsModel.preview),
                      ),
                      // Description and share/explore buttons.
                      Semantics(
                        container: true,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: DefaultTextStyle(
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium!,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // This array contains the three line description on each card
                                // demo.
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    newsModel.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.black54),
                                  ),
                                ),
                                Text(newsModel.shortText),
                                Text(newsModel.date.toString()),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Read more'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
