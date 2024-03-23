import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/presentation/stores/events_store.dart';
import 'package:tennis_club_app/presentation/widgets/event_card_widget.dart';

import '../../locator.dart';

class EventWidget extends StatelessWidget {
  EventWidget({super.key});
  final EventStore _eventStore = locator<EventStore>();

  List<EventCardWidget> convertEventsToWidgets() {
    List<EventCardWidget> widgets = [];
    for (var event in _eventStore.eventModel) {
      widgets.add(EventCardWidget(eventModel: event));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    _eventStore.getEvents();
    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Observer(
              builder: (_) => Column(
                    children: convertEventsToWidgets(),
                  )),
        ));
  }
}
