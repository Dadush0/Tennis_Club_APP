import 'package:tennis_club_app/data/models/TeamModel.dart';

class LineupModel {
  late List<TeamModel> teams;
  late String favoriteTeam;

  LineupModel({required this.teams, required this.favoriteTeam});
  LineupModel.empty() {
    teams = [];
    favoriteTeam = '';
  }
}
