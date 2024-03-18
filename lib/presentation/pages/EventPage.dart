import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/MainStore.dart';
import 'package:tennis_club_app/presentation/widgets/EventAddWidget.dart';
import 'package:tennis_club_app/presentation/widgets/EventWidget.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});
  final MainStore _mainStore = locator<MainStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: EventWidget()),
      floatingActionButton: Observer(
        builder: (_) => Visibility(
            visible: _mainStore.adminView.value,
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => EventAddWidget()));
              },
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
