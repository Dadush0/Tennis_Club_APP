import 'package:flutter/material.dart';
import 'package:tennis_club_app/presentation/widgets/game_widget.dart';

class LineupPage extends StatelessWidget {
  const LineupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical, child: GameWidget()));
  }
}
