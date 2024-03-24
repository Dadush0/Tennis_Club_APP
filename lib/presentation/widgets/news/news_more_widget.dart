import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/localization.dart';

class NewsMoreWidget extends StatelessWidget {
  const NewsMoreWidget({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              container: true,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: DefaultTextStyle(
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.keyboard_backspace_sharp),
                      ),
                      FutureBuilder(
                          future: FirebaseConnection.downloadImage(
                              newsModel.preview),
                          builder: (BuildContext context,
                              AsyncSnapshot<Image> image) {
                            return SizedBox(
                              height: 184,
                              width: double.infinity,
                              child: image.data,
                            );
                          }),
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
                      Text(
                        newsModel.shortText,
                      ),
                      const Text(''),
                      Text(
                        newsModel.content,
                        maxLines: 30,
                      ),
                      const Text(''),
                      Text(Localization.formatDate(newsModel.date)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
