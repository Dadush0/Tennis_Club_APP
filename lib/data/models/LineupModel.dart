import 'package:tennis_club_app/data/models/TeamModel.dart';

class LineupModel {
  List<TeamModel> teams;
  String favoriteTeam;

  LineupModel({required this.teams, required this.favoriteTeam});
}
