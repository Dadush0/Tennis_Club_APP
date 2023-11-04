import 'package:tennis_club_app/data/models/LineupModel.dart';
import 'package:tennis_club_app/data/repositories/LineupRepository.dart';

class GetLineup {
  final LineupRepository repository;
  GetLineup(this.repository);

  LineupModel call() {
    return repository.getLineUp();
  }
}
