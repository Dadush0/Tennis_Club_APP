import 'package:tennis_club_app/data/datasources/dataStub.dart';

class MainRepository {
  final DataStub data;

  MainRepository({
    required this.data,
  });

  bool checkPassword(String password) {
    return data.checkPassword(password);
  }
}
