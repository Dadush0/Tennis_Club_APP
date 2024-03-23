import 'package:tennis_club_app/data/models/team_model.dart';
import 'package:tennis_club_app/data/repositories/lineup_repository.dart';

class GetGamesByTeam {
  final LineupRepository repository;
  GetGamesByTeam(this.repository);

  TeamModel call(String teamname) {
    return repository.getGamesByTeam(teamname);
  }
}
