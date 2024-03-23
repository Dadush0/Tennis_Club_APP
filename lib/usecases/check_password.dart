import 'package:tennis_club_app/data/repositories/main_repository.dart';

class CheckPassword {
  final MainRepository repository;
  CheckPassword(this.repository);

  Future<bool> call(String password) {
    return repository.checkPassword(password);
  }
}
