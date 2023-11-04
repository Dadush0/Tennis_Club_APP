import 'package:tennis_club_app/data/models/PlayerModel.dart';

class GameModel {
  late DateTime date;
  late List<PlayerModel> players;
  late String location;
  late String opponentName;
  late List<PlayerModel> cakes;
  late PlayerModel manager;

  List<String> convertToStringList() {
    List<String> values = [];
    String text = '';
    values.add(date.toString());
    values.add(location);
    values.add(opponentName);
    for (var element in players) {
      text += '${element.displayName}\n';
    }
    values.add(text);
    text = '';
    for (var element in cakes) {
      text += '${element.displayName}\n';
    }
    values.add(text);
    values.add(manager.displayName);
    return values;
  }
}
