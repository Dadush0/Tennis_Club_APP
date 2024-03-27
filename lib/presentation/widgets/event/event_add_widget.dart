import 'package:flutter/material.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/stores/events_store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';

import '../../../locator.dart';

class EventAddWidget extends StatelessWidget {
  EventAddWidget({super.key});
  final EventStore _eventStore = locator<EventStore>();
  final MainStore _mainStore = locator<MainStore>();
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
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.title,
                hintText: AppLocalizations.of(context)!.titleHint,
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_eventStore.newEvent.nonObservableValue.description = value},
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.description,
                hintText: AppLocalizations.of(context)!.descriptionHint,
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_eventStore.newEvent.nonObservableValue.location = value},
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.location,
                hintText: AppLocalizations.of(context)!.locationHint,
              ),
            ),
            TextField(
              controller: datePickerController
                ..text = Localization.formatDate(DateTime.now()),
              readOnly: true,
              decoration: InputDecoration(
                  helperText: AppLocalizations.of(context)!.selectDate),
              onTap: () => onTapDateFunction(context: context),
            ),
            TextField(
              controller: registerDatePickerController
                ..text = Localization.formatDate(DateTime.now()),
              readOnly: true,
              decoration: InputDecoration(
                  helperText: AppLocalizations.of(context)!.selectDeadline),
              onTap: () => onTapRegisterDateFunction(context: context),
            ),
            TextField(
              onChanged: (value) => {
                _eventStore.newEvent.nonObservableValue.cost = int.parse(value)
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.cost,
                hintText: AppLocalizations.of(context)!.costHint,
              ),
            ),
            TextField(
              onChanged: (value) => {
                if (int.parse(value) > 0)
                  {
                    _eventStore.newEvent.nonObservableValue.maxParticipants =
                        int.parse(value)
                  }
                else
                  {
                    _eventStore.newEvent.nonObservableValue.maxParticipants =
                        1000
                  }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.maxParticipants,
                hintText: AppLocalizations.of(context)!.maxParticipantsHint,
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
                if (_eventStore.newEvent.nonObservableValue.title != '') {
                  _eventStore.addEvent();
                  _eventStore.resetEvent();
                  _eventStore.getEvents();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(_mainStore.scaffoldKey.currentContext!)
                      .showSnackBar(SnackBar(
                          content: Text(
                              AppLocalizations.of(context)!.titleMissing)));
                }
              },
              child: Text(AppLocalizations.of(context)!.create),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () {
                _eventStore.resetEvent();
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.cancel),
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
      locale: Locale(language),
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
      locale: Locale(language),
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
