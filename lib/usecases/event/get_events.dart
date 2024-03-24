import 'package:tennis_club_app/data/models/event_model.dart';
import 'package:tennis_club_app/data/repositories/event_repository.dart';

class GetEvents {
  final EventRepository repository;
  GetEvents(this.repository);

  List<EventModel> call() {
    return repository.getEvents();
  }
}
