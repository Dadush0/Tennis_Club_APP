import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/repositories/LineupRepository.dart';

class DeleteGame {
  final LineupRepository repository;
  DeleteGame(this.repository);

  void call(GameModel game, String teamName) {
    repository.deleteGame(game, teamName);
  }
}
