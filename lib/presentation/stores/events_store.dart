import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/event_model.dart';
import 'package:tennis_club_app/usecases/add_event.dart';
import 'package:tennis_club_app/usecases/delete_event.dart';
import 'package:tennis_club_app/usecases/get_events.dart';

import '../../locator.dart';

part 'events_store.g.dart';

// ignore: library_private_types_in_public_api
class EventStore = _EventStore with _$EventStore;

abstract class _EventStore with Store {
  final GetEvents _getEvents = locator<GetEvents>();
  final AddEvent _addEvent = locator<AddEvent>();
  final DeleteEvent _deleteEvent = locator<DeleteEvent>();

  @observable
  ObservableList<EventModel> eventModel = <EventModel>[].asObservable();

  @observable
  Observable<EventModel> newEvent = Observable(EventModel.empty());

  @action
  void setEvents(EventModel eventModel) {
    newEvent = Observable(eventModel);
  }

  @action
  Future<void> getEvents() async {
    eventModel.clear();
    eventModel.addAll(_getEvents.call());
  }

  void addEvent() {
    _addEvent.call(newEvent.value);
  }

  void deleteEvent() {
    _deleteEvent.call(newEvent.value);
  }

  void resetEvent() {
    newEvent = Observable(EventModel.empty());
  }
}
