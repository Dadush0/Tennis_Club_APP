import 'package:tennis_club_app/data/models/lineup_model.dart';
import 'package:tennis_club_app/data/repositories/lineup_repository.dart';

class GetLineup {
  final LineupRepository repository;
  GetLineup(this.repository);

  LineupModel call() {
    return repository.getLineUp();
  }
}
