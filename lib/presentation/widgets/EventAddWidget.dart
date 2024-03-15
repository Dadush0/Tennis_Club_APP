import 'package:flutter/material.dart';
import 'package:tennis_club_app/presentation/stores/EventStore.dart';

import '../../locator.dart';

class EventAddWidget extends StatelessWidget {
  EventAddWidget({super.key});
  final EventStore _eventStore = locator<EventStore>();

  @override
  Widget build(BuildContext context) {
    return Text('todo');
  }
}
