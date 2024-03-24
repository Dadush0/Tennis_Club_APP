import 'package:tennis_club_app/data/repositories/lineup_repository.dart';

class GetFavouriteTeam {
  final LineupRepository repository;
  GetFavouriteTeam(this.repository);

  String call() {
    return repository.getFavouriteTeam();
  }
}
