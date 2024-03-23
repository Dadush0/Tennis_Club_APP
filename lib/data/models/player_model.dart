class PlayerModel {
  late String displayName;
  late int age;

  PlayerModel({required this.displayName});
  PlayerModel.empty() {
    PlayerModel(displayName: '');
  }

  static Map<String, dynamic> serializePlayers(List<PlayerModel> players) {
    Map<String, dynamic> playerList = {};
    int index = 1;
    for (var element in players) {
      playerList.putIfAbsent("p$index", () => element.displayName);
      index++;
    }
    return playerList;
  }

  static List<PlayerModel> deserializePlayers(Map players) {
    List<PlayerModel> playerList = [];
    players.forEach((key, value) {
      playerList.add(PlayerModel(displayName: value));
    });
    return playerList;
  }
}
