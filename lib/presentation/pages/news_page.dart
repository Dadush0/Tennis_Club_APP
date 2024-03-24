import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/widgets/news_add_widget.dart';
import 'package:tennis_club_app/presentation/widgets/news_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key});
  final MainStore _mainStore = locator<MainStore>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(language),
      home: Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical, child: NewsWidget()),
        floatingActionButton: Observer(
          builder: (context) => Visibility(
              visible: _mainStore.adminView.value,
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => NewsAddWidget()));
                },
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('de'), Locale('en')],
    );
  }
}
