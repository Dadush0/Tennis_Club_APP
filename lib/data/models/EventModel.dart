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
}
