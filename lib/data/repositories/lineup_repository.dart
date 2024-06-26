import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/data/models/data_model.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/data/models/lineup_model.dart';
import 'package:tennis_club_app/data/models/team_model.dart';

class LineupRepository {
  LineupRepository();

  LineupModel getLineUp() {
    return DataModel.lineup; // for Future types, add await
  }

  TeamModel getGamesByTeam(String teamname) {
    var lineup = DataModel.lineup;
    for (var element in lineup.teams) {
      if (element.teamName == teamname) {
        return element;
      }
    }
    return TeamModel.empty();
  }

  List<String> getAllTeams() {
    List<String> teamNames = [];
    var lineup = DataModel.lineup;
    for (var element in lineup.teams) {
      teamNames.add(element.teamName);
    }
    return teamNames;
  }

  void setFavouriteTeam(String favourite) {
    DataModel.lineup.favouriteTeam = favourite;
    FirebaseConnection.writePreferences(favourite);
  }

  String getFavouriteTeam() {
    return DataModel.lineup.favouriteTeam;
  }

  void addGame(GameModel game, String teamName) {
    DataModel.lineup.teams
        .firstWhere((element) => element.teamName == teamName)
        .games
        .add(game);
    FirebaseConnection.writeLineupData();
  }

  void deleteGame(GameModel game, String teamName) {
    DataModel.lineup.teams
        .firstWhere((element) => element.teamName == teamName)
        .games
        .remove(game);
    FirebaseConnection.writeLineupData();
  }
}
