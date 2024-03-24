import 'package:tennis_club_app/data/repositories/lineup_repository.dart';

class SetFavouriteTeam {
  final LineupRepository repository;
  SetFavouriteTeam(this.repository);

  void call(String favourite) {
    repository.setFavouriteTeam(favourite);
  }
}
