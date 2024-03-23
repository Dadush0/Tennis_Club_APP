import 'package:tennis_club_app/data/models/player_model.dart';

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

  static Map<String, dynamic> serializeGames(List<GameModel> games) {
    Map<String, dynamic> game = {};
    Map<String, dynamic> gameList = {};
    int index = 1;
    for (var element in games) {
      game = {
        "date": element.date.toString(),
        "location": element.location,
        "manager": element.manager.displayName,
        "opponentName": element.opponentName,
        "cakes": PlayerModel.serializePlayers(element.cakes),
        "players": PlayerModel.serializePlayers(element.players),
      };
      gameList.putIfAbsent("g$index", () => game);
      index++;
    }
    return gameList;
  }

  static List<GameModel> deserializeGames(Map games) {
    List<GameModel> gameList = [];
    games.forEach((key, value) {
      GameModel gameModel = GameModel(
          date: DateTime.parse(value['date']),
          players: [],
          location: value['location'],
          opponentName: value['opponentName'],
          cakes: [],
          manager: PlayerModel(displayName: value['manager']));
      gameModel.players = PlayerModel.deserializePlayers(value['players']);
      gameModel.cakes = PlayerModel.deserializePlayers(value['cakes']);
      gameList.add(gameModel);
    });
    return gameList;
  }
}
