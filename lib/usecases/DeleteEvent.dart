import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/data/repositories/EventRepository.dart';

class DeleteEvent {
  final EventRepository repository;
  DeleteEvent(this.repository);

  void call(EventModel eventModel) {
    repository.deleteEvent(eventModel);
  }
}
