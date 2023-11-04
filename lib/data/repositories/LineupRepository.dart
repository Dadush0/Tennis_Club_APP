import 'package:tennis_club_app/data/datasources/dataStub.dart';
import 'package:tennis_club_app/data/models/LineupModel.dart';

class LineupRepository {
  final DataStub data;

  LineupRepository({
    required this.data,
  });

  LineupModel getLineUp() {
    return data.getLineUp(); // for Future types, add await
  }
}
