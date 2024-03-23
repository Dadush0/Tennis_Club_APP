import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/data/repositories/lineup_repository.dart';

class DeleteGame {
  final LineupRepository repository;
  DeleteGame(this.repository);

  void call(GameModel game, String teamName) {
    repository.deleteGame(game, teamName);
  }
}
