import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/data/repositories/EventRepository.dart';

class AddEvent {
  final EventRepository repository;
  AddEvent(this.repository);

  void call(EventModel eventModel) {
    repository.addEvent(eventModel);
  }
}
