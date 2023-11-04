import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/usecases/GetLineup.dart';

part 'LineupStore.g.dart';

class LineupStore = _LineupStore with _$LineupStore;

abstract class _LineupStore with Store {
  final GetLineup _getLineup = locator<GetLineup>();
  @observable
  late ObservableList<TeamModel> lineup = [TeamModel()].asObservable();

  @action
  Future<void> getLineup() async {
    var result = _getLineup.call();
    lineup = result.teams.asObservable();
  }
}
