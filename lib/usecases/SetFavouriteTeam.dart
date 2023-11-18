import 'package:tennis_club_app/data/repositories/LineupRepository.dart';

class SetFavouriteTeam {
  final LineupRepository repository;
  SetFavouriteTeam(this.repository);

  void call(String favourite) {
    repository.SetFavouriteTeam(favourite);
  }
}
