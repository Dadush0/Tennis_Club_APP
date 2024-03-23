import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/EventStore.dart';

class EventDeleteWidget extends StatelessWidget {
  EventDeleteWidget({super.key, required this.eventModel});
  final EventStore _eventstore = locator<EventStore>();
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: null,
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text('Yes'),
                  onPressed: () {
                    _eventstore.setEvents(eventModel);
                    _eventstore.deleteEvent();
                    _eventstore.getEvents();
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
