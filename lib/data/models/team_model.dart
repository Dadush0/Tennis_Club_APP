import 'package:tennis_club_app/data/models/data_model.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/data/models/player_model.dart';

class TeamModel {
  late String teamName;
  late List<GameModel> games;
  late List<PlayerModel> players;
  late String trainer;

  TeamModel({required this.teamName});

  TeamModel.empty() {
    teamName = '';
    games = [];
    players = [];
    trainer = '';
  }

  static void deserializeTeams(Map teams) {
    DataModel.lineup.teams = [];
    teams.forEach((key, value) {
      TeamModel teamModel = TeamModel(teamName: value['teamName']);
      teamModel.games = GameModel.deserializeGames(value['games']);
      teamModel.trainer = value['trainer'];
      DataModel.lineup.teams.add(teamModel);
    });
  }
}
