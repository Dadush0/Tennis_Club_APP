import 'package:tennis_club_app/data/models/data_model.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/data/models/team_model.dart';

class LineupModel {
  late List<TeamModel> teams;
  late String favoriteTeam;

  LineupModel({required this.teams, required this.favoriteTeam});
  LineupModel.empty() {
    teams = [];
    favoriteTeam = '';
  }

  static Map<String, dynamic> serializeLineup() {
    Map<String, dynamic> team = {};
    Map<String, dynamic> teamList = {};
    int index = 1;
    for (var element in DataModel.lineup.teams) {
      team = {
        "teamName": element.teamName,
        "trainer": element.trainer,
        "games": GameModel.serializeGames(element.games),
      };
      teamList.putIfAbsent("t$index", () => team);
      index++;
    }
    return teamList;
  }
}
