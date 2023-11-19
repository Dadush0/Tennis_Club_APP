import 'package:tennis_club_app/data/datasources/dataStub.dart';
import 'package:tennis_club_app/data/models/LineupModel.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';

class LineupRepository {
  final DataStub data;

  LineupRepository({
    required this.data,
  });

  LineupModel getLineUp() {
    return data.getLineUp(); // for Future types, add await
  }

  TeamModel getGamesByTeam(String teamname) {
    var lineup = data.getLineUp();
    for (var element in lineup.teams) {
      if (element.teamName == teamname) {
        return element;
      }
    }
    return lineup.teams.first;
  }

  List<String> getAllTeams() {
    List<String> teamNames = [];
    var lineup = data.getLineUp();
    for (var element in lineup.teams) {
      teamNames.add(element.teamName);
    }
    return teamNames;
  }

  void setFavouriteTeam(String favourite) {
    data.setFavouriteTeam(favourite);
  }
}
