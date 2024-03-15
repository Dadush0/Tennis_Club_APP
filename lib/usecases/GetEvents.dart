import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/data/repositories/EventRepository.dart';

class GetEvents {
  final EventRepository repository;
  GetEvents(this.repository);

  List<EventModel> call() {
    return repository.getEvents();
  }
}
