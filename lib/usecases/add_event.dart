import 'package:tennis_club_app/data/models/event_model.dart';
import 'package:tennis_club_app/data/repositories/event_repository.dart';

class AddEvent {
  final EventRepository repository;
  AddEvent(this.repository);

  void call(EventModel eventModel) {
    repository.addEvent(eventModel);
  }
}
