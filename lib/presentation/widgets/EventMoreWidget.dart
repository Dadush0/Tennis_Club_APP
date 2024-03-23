import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/EventModel.dart';

class EventMoreWidget extends StatelessWidget {
  const EventMoreWidget({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.people),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Participants'),
            content: getListOfParticipants(),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  Widget getListOfParticipants() {
    List<Text> participants = [];
    for (var element in eventModel.participants) {
      participants.add(Text(element));
    }
    return Column(mainAxisSize: MainAxisSize.min, children: participants);
  }
}
