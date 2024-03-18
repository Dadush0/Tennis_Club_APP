import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/models/LineupModel.dart';
import 'package:tennis_club_app/data/models/PlayerModel.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';

// This is a data Stub for testing purposes
class DataStub {
  late LineupModel lineupModel;
  DataStub() {
    PlayerModel player1 = PlayerModel(displayName: 'Wirtz');
    PlayerModel player2 = PlayerModel(displayName: 'Dagostini');
    PlayerModel player3 = PlayerModel(displayName: 'Cunt');
    PlayerModel player4 = PlayerModel(displayName: 'DumbFuck');
    PlayerModel player5 = PlayerModel(displayName: 'Pascal');
    PlayerModel player6 = PlayerModel(displayName: 'Dadush');

    GameModel gameModel1 = GameModel(
        date: DateTime.now(),
        players: [player1, player2, player3, player4],
        location: "Home",
        opponentName: "opponent1",
        cakes: [player1, player2],
        manager: player1);

    GameModel gameModel2 = GameModel(
        date: DateTime.now(),
        players: [player1, player2, player5, player6],
        location: "Away",
        opponentName: "opponent2",
        cakes: [player1, player2],
        manager: player2);

    GameModel gameModel3 = GameModel(
        date: DateTime.now(),
        players: [player1, player2, player4, player6],
        location: "Home",
        opponentName: "opponent3",
        cakes: [player1, player2],
        manager: player2);

    TeamModel teamModel1 = TeamModel(teamName: 'Team1');
    teamModel1.games = [gameModel1];
    TeamModel teamModel2 = TeamModel(teamName: 'Team2');
    teamModel2.games = [gameModel2, gameModel3];

    lineupModel =
        LineupModel(teams: [teamModel1, teamModel2], favoriteTeam: '');
  }
  LineupModel getLineUp() {
    return lineupModel;
  }

  void setFavouriteTeam(String favorite) {
    lineupModel.favoriteTeam = favorite;
  }

  String getFavouriteTeam() {
    return lineupModel.favoriteTeam;
  }

  void addGame(GameModel game, String teamName) {
    lineupModel.teams
        .firstWhere((element) => element.teamName == teamName)
        .games
        .add(game);
  }

  void deleteGame(GameModel model, String teamName) {
    lineupModel.teams
        .firstWhere((element) => element.teamName == teamName)
        .games
        .remove(model);
  }

  bool checkPassword(String password) {
    return password == 'abc';
  }
}
