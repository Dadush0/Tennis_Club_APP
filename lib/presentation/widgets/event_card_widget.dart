import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/data/models/event_model.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/events_store.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/widgets/delete_widget.dart';
import 'package:tennis_club_app/presentation/widgets/event_more_widget.dart';

class EventCardWidget extends StatelessWidget {
  EventCardWidget({super.key, required this.eventModel});
  final EventModel eventModel;
  final EventStore _eventStore = locator<EventStore>();
  final MainStore _mainStore = locator<MainStore>();

  @override
  Widget build(BuildContext context) {
    bool full = eventModel.participants.length >= eventModel.maxParticipants;
    bool tooLate = DateTime.now().compareTo(eventModel.registerDate) == 1;
    return SizedBox(
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Semantics(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  container: true,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            eventModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black54),
                          ),
                        ),
                        Text(
                          eventModel.description,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 30,
                        ),
                        Text(
                            'When?  ${Localization.formatDate(eventModel.date)}'),
                        Text('Where?  ${eventModel.location}'),
                        Text(
                            'Register Until?  ${Localization.formatDate(eventModel.registerDate)}'),
                        Text(
                            'Max. Participants?  ${eventModel.maxParticipants.toString()}'),
                        Text('Cost?  ${eventModel.cost}€'),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (!full && !tooLate) _dialogBuilder(context);
                              },
                              child: Text((tooLate
                                  ? 'Too Late'
                                  : (full ? 'Full' : 'Sign up'))),
                            ),
                            Observer(
                                builder: (_) => Visibility(
                                      visible: _mainStore.adminView.value,
                                      child: EventMoreWidget(
                                        eventModel: eventModel,
                                      ),
                                    )),
                            Observer(
                                builder: (_) => Visibility(
                                      visible: _mainStore.adminView.value,
                                      child: DeleteWidget(
                                        delete: deleteEvent,
                                      ),
                                    )),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    TextEditingController name = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign up'),
            content: Text(eventModel.title),
            actions: <Widget>[
              TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                  )),
              const Padding(
                padding: EdgeInsets.all(8),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text('Sign up'),
                  onPressed: () {
                    eventModel.participants.add(name.text);
                    _eventStore.setEvents(eventModel);
                    _eventStore.deleteEvent();
                    _eventStore.addEvent();
                    _eventStore.getEvents();
                    Navigator.pop(context);
                  },
                )
              ])
            ],
          );
        });
  }

  void deleteEvent() {
    _eventStore.setEvents(eventModel);
    _eventStore.deleteEvent();
    _eventStore.getEvents();
  }
}
