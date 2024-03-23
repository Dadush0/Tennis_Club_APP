import 'package:tennis_club_app/data/models/event_model.dart';
import 'package:tennis_club_app/data/repositories/event_repository.dart';

class DeleteEvent {
  final EventRepository repository;
  DeleteEvent(this.repository);

  void call(EventModel eventModel) {
    repository.deleteEvent(eventModel);
  }
}
