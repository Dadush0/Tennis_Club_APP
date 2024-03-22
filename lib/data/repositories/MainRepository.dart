import 'package:tennis_club_app/data/datasources/firebase.dart';

class MainRepository {
  MainRepository();

  Future<bool> checkPassword(String password) {
    return FirebaseConnection.readPassword(password);
  }
}
