import 'package:tennis_club_app/data/models/player_model.dart';

class GameModel {
  late DateTime date;
  late List<PlayerModel> players;
  late String location;
  late String opponentName;
  late List<PlayerModel> cakes;
  late List<PlayerModel> manager;

  GameModel(
      {required this.date,
      required this.players,
      required this.location,
      required this.opponentName,
      required this.cakes,
      required this.manager});

  static Map<String, dynamic> serializeGames(List<GameModel> games) {
    Map<String, dynamic> game = {};
    Map<String, dynamic> gameList = {};
    int index = 1;
    for (var element in games) {
      game = {
        "date": element.date.toString(),
        "location": element.location,
        "manager": PlayerModel.serializePlayers(element.manager),
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
          manager: []);
      gameModel.manager = PlayerModel.deserializePlayers(value['manager']);
      gameModel.players = PlayerModel.deserializePlayers(value['players']);
      gameModel.cakes = [];
      if (value.keys.contains('cakes')) {
        gameModel.cakes = PlayerModel.deserializePlayers(value['cakes']);
      }
      gameList.add(gameModel);
    });
    return gameList;
  }
}
