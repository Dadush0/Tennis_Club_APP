import 'package:tennis_club_app/data/models/EventModel.dart';

class DataStubEvents {
  late List<EventModel> eventModel;
  DataStubEvents() {
    eventModel = [
      EventModel(
          title: 'Vereinsmeisterschaft',
          description: 'Dieses'
              'Jahr findet wieder die Vereinsmeisterschaft mit Grillen statt. Bla Bla'
              'BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla'
              'BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla',
          location: 'Tennisplatz',
          date: DateTime(2023, 7, 30),
          registerDate: DateTime(2023, 7, 23),
          cost: 0,
          maxParticipants: 20,
          participants: []),
      EventModel(
          title: 'BMW',
          description: 'Dieses'
              'Jahr findet wieder die Vereinsmeisterschaft mit Grillen statt. Bla Bla'
              'BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla'
              'BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla',
          location: 'Tennisplatz',
          date: DateTime(2023, 7, 1),
          registerDate: DateTime(2023, 6, 23),
          cost: 5,
          maxParticipants: 20,
          participants: []),
      EventModel(
          title: 'ScrollTest',
          description: 'Dieses'
              'Jahr findet wieder die Vereinsmeisterschaft mit Grillen statt. Bla Bla'
              'BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla'
              'BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla',
          location: 'Tennisplatz',
          date: DateTime(2023, 7, 31),
          registerDate: DateTime(2023, 6, 23),
          cost: 5,
          maxParticipants: 20,
          participants: [])
    ];
  }

  List<EventModel> getEvents() {
    return eventModel;
  }

  void addEvent(EventModel eventModel) {
    this.eventModel.add(eventModel);
  }

  void deleteEvent(EventModel eventModel) {
    this.eventModel.remove(eventModel);
  }
}
