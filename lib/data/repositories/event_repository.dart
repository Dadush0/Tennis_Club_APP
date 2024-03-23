import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/data/models/data_model.dart';
import 'package:tennis_club_app/data/models/event_model.dart';

class EventRepository {
  EventRepository();

  List<EventModel> getEvents() {
    List<EventModel> eventModel = DataModel.events;
    eventModel.sort(sortEventsByDate);
    return eventModel;
  }

  void addEvent(EventModel eventModel) {
    DataModel.events.add(eventModel);
    FirebaseConnection.writeEventsData();
  }

  void deleteEvent(EventModel eventModel) {
    DataModel.events.remove(eventModel);
    FirebaseConnection.writeEventsData();
  }

  int sortEventsByDate(EventModel a, EventModel b) {
    return a.date.compareTo(b.date); // Asc
  }
}
