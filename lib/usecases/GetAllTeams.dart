import 'package:tennis_club_app/data/repositories/LineupRepository.dart';

class GetAllTeams {
  final LineupRepository repository;
  GetAllTeams(this.repository);

  List<String> call() {
    return repository.getAllTeams();
  }
}
