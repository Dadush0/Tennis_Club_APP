import 'package:flutter/material.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/presentation/stores/events_store.dart';

import '../../locator.dart';

class EventAddWidget extends StatelessWidget {
  EventAddWidget({super.key});
  final EventStore _eventStore = locator<EventStore>();
  final TextEditingController datePickerController = TextEditingController();
  final TextEditingController registerDatePickerController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) =>
                  {_eventStore.newEvent.nonObservableValue.title = value},
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter a title',
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_eventStore.newEvent.nonObservableValue.description = value},
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter your description',
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_eventStore.newEvent.nonObservableValue.location = value},
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Location',
                hintText: 'Enter your location',
              ),
            ),
            TextField(
              controller: datePickerController
                ..text = Localization.formatDate(DateTime.now()),
              readOnly: true,
              decoration: const InputDecoration(hintText: "Select Date"),
              onTap: () => onTapDateFunction(context: context),
            ),
            TextField(
              controller: registerDatePickerController
                ..text = Localization.formatDate(DateTime.now()),
              readOnly: true,
              decoration:
                  const InputDecoration(hintText: "Select Register deadline"),
              onTap: () => onTapRegisterDateFunction(context: context),
            ),
            TextField(
              onChanged: (value) => {
                _eventStore.newEvent.nonObservableValue.cost = int.parse(value)
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cost',
                hintText: 'Enter your cost',
              ),
            ),
            TextField(
              onChanged: (value) => {
                _eventStore.newEvent.nonObservableValue.maxParticipants =
                    int.parse(value)
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Max. Participants',
                hintText: 'Enter your maximum number of participants',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () {
                _eventStore.addEvent();
                _eventStore.resetEvent();
                _eventStore.getEvents();
                Navigator.pop(context);
              },
              child: const Text('Create'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () {
                _eventStore.resetEvent();
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            )
          ],
        ),
      ),
    )));
  }

  onTapDateFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(DateTime.now().year + 1),
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      locale: const Locale('de', 'DE'),
    );
    if (pickedDate == null) return;
    datePickerController.text = Localization.formatDate(pickedDate);
    _eventStore.newEvent.nonObservableValue.date = DateTime.now().copyWith(
        year: pickedDate.year, month: pickedDate.month, day: pickedDate.day);
  }

  onTapRegisterDateFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: _eventStore.newEvent.nonObservableValue.date,
      firstDate: DateTime(DateTime.now().year - 1),
      initialDate: DateTime.now(),
      locale: const Locale('de', 'DE'),
    );
    if (pickedDate == null) return;
    registerDatePickerController.text = Localization.formatDate(pickedDate);
    _eventStore.newEvent.nonObservableValue.registerDate = DateTime.now()
        .copyWith(
            year: pickedDate.year,
            month: pickedDate.month,
            day: pickedDate.day);
  }
}
