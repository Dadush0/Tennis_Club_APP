import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/data/repositories/lineup_repository.dart';

class AddGame {
  final LineupRepository repository;
  AddGame(this.repository);

  void call(GameModel game, String teamName) {
    repository.addGame(game, teamName);
  }
}
