import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/usecases/AddEvent.dart';
import 'package:tennis_club_app/usecases/DeleteEvent.dart';
import 'package:tennis_club_app/usecases/GetEvents.dart';

import '../../locator.dart';

part 'EventStore.g.dart';

// TODO: consider private or public see MainStore
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
