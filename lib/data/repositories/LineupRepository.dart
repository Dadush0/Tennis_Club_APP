import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/data/models/DataModel.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/models/LineupModel.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';

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
    return lineup.teams.first;
  }

  List<String> getAllTeams() {
    List<String> teamNames = [];
    var lineup = DataModel.lineup;
    for (var element in lineup.teams) {
      teamNames.add(element.teamName);
    }
    return teamNames;
  }

  void setFavouriteTeam(String favorite) {
    DataModel.lineup.favoriteTeam = favorite;
  }

  String getFavouriteTeam() {
    return DataModel.lineup.favoriteTeam;
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
