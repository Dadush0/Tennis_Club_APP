import 'package:flutter/material.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/widgets/EventAddWidget.dart';
import 'package:tennis_club_app/presentation/widgets/EventWidget.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: EventWidget()),
      floatingActionButton: Visibility(
          visible: admin,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => EventAddWidget()));
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
