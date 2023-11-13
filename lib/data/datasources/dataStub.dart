import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/models/LineupModel.dart';
import 'package:tennis_club_app/data/models/PlayerModel.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';

// This is a data Stub for testing purposes
class DataStub {
  LineupModel getLineUp() {
    PlayerModel player1 = PlayerModel();
    player1.displayName = "Wirtz";
    PlayerModel player2 = PlayerModel();
    player2.displayName = "Dagostini";

    LineupModel lineupModel = LineupModel(teams: [], favoriteTeam: '');
    lineupModel.teams = [TeamModel(), TeamModel()];

    lineupModel.teams.first.teamName = "Team1";

    lineupModel.teams.first.games = [GameModel()];
    lineupModel.teams.first.games.first.opponentName = "opponent1";
    lineupModel.teams.first.games.first.date = DateTime.now();
    lineupModel.teams.first.games.first.location = "Home";
    lineupModel.teams.first.games.first.manager = player1;
    lineupModel.teams.first.games.first.cakes = [player1, player2];
    lineupModel.teams.first.games.first.players = [player1, player2];

    lineupModel.teams.last.teamName = "Team2";

    lineupModel.teams.last.games = [GameModel()];
    lineupModel.teams.last.games.first.opponentName = "opponent2";
    lineupModel.teams.last.games.first.date = DateTime.now();
    lineupModel.teams.last.games.first.location = "Away";
    lineupModel.teams.last.games.first.manager = player2;
    lineupModel.teams.last.games.first.cakes = [player1, player2];
    lineupModel.teams.last.games.first.players = [player1, player2];

    return lineupModel;
  }
}
