import 'package:flutter/material.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/widgets/NewsAddWidget.dart';
import 'package:tennis_club_app/presentation/widgets/NewsWidget.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: NewsWidget()),
      floatingActionButton: Visibility(
          visible: admin,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => NewsAddWidget()));
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
