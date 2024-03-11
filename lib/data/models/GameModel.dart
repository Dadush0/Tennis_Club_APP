import 'package:tennis_club_app/data/models/PlayerModel.dart';

class GameModel {
  late DateTime date;
  late List<PlayerModel> players;
  late String location;
  late String opponentName;
  late List<PlayerModel> cakes;
  late PlayerModel manager;

  GameModel(
      {required this.date,
      required this.players,
      required this.location,
      required this.opponentName,
      required this.cakes,
      required this.manager});

  GameModel.empty() {
    GameModel(
        opponentName: '',
        location: '',
        cakes: [PlayerModel.empty(), PlayerModel.empty()],
        players: [
          PlayerModel.empty(),
          PlayerModel.empty(),
          PlayerModel.empty(),
          PlayerModel.empty()
        ],
        manager: PlayerModel.empty(),
        date: DateTime.now());
  }
}
