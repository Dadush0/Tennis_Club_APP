import 'package:tennis_club_app/data/models/data_model.dart';

class EventModel {
  late String title;
  late String description;
  late String location;
  late DateTime date;
  late DateTime registerDate;
  late int maxParticipants;
  late List<String> participants;
  late int cost;

  EventModel(
      {required this.title,
      required this.description,
      required this.location,
      required this.date,
      required this.registerDate,
      required this.cost,
      required this.maxParticipants,
      required this.participants});

  EventModel.empty() {
    title = '';
    description = '';
    location = '';
    date = DateTime.now();
    registerDate = DateTime.now();
    maxParticipants = 0;
    participants = [];
    cost = 0;
  }

  static Map<String, dynamic> serializeEvents() {
    Map<String, dynamic> events = {};
    Map<String, dynamic> eventList = {};
    int index = 1;
    for (var element in DataModel.events) {
      events = {
        "cost": element.cost,
        "description": element.description,
        "location": element.location,
        "maxParticipants": element.maxParticipants,
        "date": element.date.toString(),
        "registerDate": element.registerDate.toString(),
        "title": element.title,
        "participants": element.participants,
      };
      eventList.putIfAbsent("e$index", () => events);
      index++;
    }
    return eventList;
  }

  static void deserializeEvents(Map events) {
    events.forEach((key, value) {
      EventModel eventModel = EventModel(
          title: value['title'],
          description: value['description'],
          location: value['location'],
          date: DateTime.parse(value['date']),
          registerDate: DateTime.parse(value['registerDate']),
          cost: value['cost'],
          maxParticipants: value['maxParticipants'],
          participants: []); // List
      if (value['participants'] != null) {
        List<dynamic> data = value['participants'];

        for (var element in data) {
          eventModel.participants.add(element);
        }
      }
      DataModel.events.add(eventModel);
    });
  }
}
