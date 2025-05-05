import 'package:tennis_club_app/data/models/data_model.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/data/models/player_model.dart';

class TeamModel {
  late String teamName;
  late List<GameModel> games;
  late List<PlayerModel> players;
  late String trainer;
  late int playerCount;

  TeamModel({required this.teamName});

  TeamModel.empty() {
    teamName = '';
    games = [];
    players = [];
    trainer = '';
    playerCount = 4;
  }

  static void deserializeTeams(Map teams) {
    DataModel.lineup.teams = [];
    teams.forEach((key, value) {
      TeamModel teamModel = TeamModel(teamName: value['teamName']);
      if (value.keys.contains('games')) {
        teamModel.games = GameModel.deserializeGames(value['games']);
      } else {
        teamModel.games = [];
      }
      teamModel.trainer = value['trainer'];
      teamModel.playerCount = value['playerCount'];
      DataModel.lineup.teams.add(teamModel);
    });
  }
}
