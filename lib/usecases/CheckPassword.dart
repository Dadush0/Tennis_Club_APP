import 'package:tennis_club_app/data/repositories/MainRepository.dart';

class CheckPassword {
  final MainRepository repository;
  CheckPassword(this.repository);

  bool call(String password) {
    return repository.checkPassword(password);
  }
}
