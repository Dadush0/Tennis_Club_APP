import 'package:flutter/material.dart';
import 'package:tennis_club_app/presentation/widgets/NewsWidget.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical, child: NewsWidget());
  }
}
