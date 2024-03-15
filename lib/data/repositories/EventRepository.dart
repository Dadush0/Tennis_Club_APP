import 'package:tennis_club_app/data/datasources/dataStubEvents.dart';
import 'package:tennis_club_app/data/models/EventModel.dart';

class EventRepository {
  final DataStubEvents data;

  EventRepository({
    required this.data,
  });

  List<EventModel> getEvents() {
    List<EventModel> eventModel = data.getEvents();
    eventModel.sort(sortEventsByDate);
    return eventModel;
  }

  void addEvent(EventModel eventModel) {
    data.addEvent(eventModel);
  }

  void deleteEvent(EventModel eventModel) {
    data.deleteEvent(eventModel);
  }

  int sortEventsByDate(EventModel a, EventModel b) {
    return a.date.compareTo(b.date); // Asc
  }
}
