import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/repositories/LineupRepository.dart';

class AddGame {
  final LineupRepository repository;
  AddGame(this.repository);

  void call(GameModel game, String teamName) {
    repository.addGame(game, teamName);
  }
}
