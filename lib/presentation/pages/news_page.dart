import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/widgets/news_add_widget.dart';
import 'package:tennis_club_app/presentation/widgets/news_widget.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key});
  final MainStore _mainStore = locator<MainStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: NewsWidget()),
      floatingActionButton: Observer(
        builder: (_) => Visibility(
            visible: _mainStore.adminView.value,
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => NewsAddWidget()));
              },
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
