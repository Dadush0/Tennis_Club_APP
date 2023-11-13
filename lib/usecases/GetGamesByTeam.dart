import 'package:tennis_club_app/data/models/TeamModel.dart';
import 'package:tennis_club_app/data/repositories/LineupRepository.dart';

class GetGamesByTeam {
  final LineupRepository repository;
  GetGamesByTeam(this.repository);

  TeamModel call(String teamname) {
    return repository.getGamesByTeam(teamname);
  }
}
