import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/models/PlayerModel.dart';

class TeamModel {
  late String teamName;
  late List<GameModel> games;
  late List<PlayerModel> players;
  late PlayerModel trainer;
}
