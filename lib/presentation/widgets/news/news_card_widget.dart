import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/stores/news_store.dart';
import 'package:tennis_club_app/presentation/widgets/delete_widget.dart';
import 'package:tennis_club_app/presentation/widgets/news/news_more_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsCardWidget extends StatelessWidget {
  NewsCardWidget({super.key, required this.newsModel});
  final NewsModel newsModel;
  final MainStore _mainStore = locator<MainStore>();
  final NewsStore _newsStore = locator<NewsStore>();

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
              FutureBuilder(
                  future: FirebaseConnection.downloadImage(newsModel.preview),
                  builder: (BuildContext context, AsyncSnapshot<Image> image) {
                    return SizedBox(
                      height: 184,
                      width: double.infinity,
                      child: image.data,
                    );
                  }),
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
                                .titleLarge!
                                .copyWith(color: Colors.black54),
                          ),
                        ),
                        Text(newsModel.shortText),
                        Text(Localization.formatDate(newsModel.date)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            newsModel.content != ''
                                ? ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  NewsMoreWidget(
                                                      newsModel: newsModel)));
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)!.readMore))
                                : Container(),
                            Observer(
                                builder: (_) => Visibility(
                                      visible: _mainStore.adminView.value,
                                      child: DeleteWidget(
                                        delete: deleteNews,
                                      ),
                                    ))
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

  void deleteNews() {
    _newsStore.deleteNews(newsModel);
    _newsStore.getNews();
  }
}
