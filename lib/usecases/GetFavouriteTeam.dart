import 'package:tennis_club_app/data/repositories/LineupRepository.dart';

class GetFavouriteTeam {
  final LineupRepository repository;
  GetFavouriteTeam(this.repository);

  String call() {
    return repository.getFavouriteTeam();
  }
}
