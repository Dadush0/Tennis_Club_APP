import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/presentation/widgets/NewsMoreWidget.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Card(
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
                        Text(Localization.formatDate(newsModel.date)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              NewsMoreWidget(
                                                  newsModel: newsModel)));
                                }, // TODO: improve routing/page system
                                child: const Text('Read more'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
