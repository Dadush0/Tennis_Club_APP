import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/widgets/GameAddWidget.dart';
import 'package:tennis_club_app/usecases/GetAllTeams.dart';
import 'package:tennis_club_app/usecases/GetGamesByTeam.dart';
import 'package:tennis_club_app/usecases/GetLineup.dart';
import 'package:tennis_club_app/usecases/SetFavouriteTeam.dart';

part 'LineupStore.g.dart';

// TODO: consider private or public see MainStore
// ignore: library_private_types_in_public_api
class LineupStore = _LineupStore with _$LineupStore;

abstract class _LineupStore with Store {
  final GetLineup _getLineup = locator<GetLineup>();
  final GetGamesByTeam _getGamesByTeam = locator<GetGamesByTeam>();
  final GetAllTeams _getAllTeams = locator<GetAllTeams>();
  final SetFavouriteTeam _setFavouriteTeam = locator<SetFavouriteTeam>();
  @observable
  ObservableList<TeamModel> lineup = <TeamModel>[].asObservable();
  List<String> teamNames = [];

  @observable
  Observable<bool> customTileExpanded = false.obs();

  @observable
  Observable<int> dialogIndex = DialogState.gameInfo.index.obs();

  @observable
  Observable<String> submitButton = 'Next'.obs();

  @observable
  Observable<bool> switchButton = false.obs();

  String selectedItem = '';

  @action
  Future<void> getLineup() async {
    lineup.addAll(_getLineup.call().teams);
  }

  @action
  Future<void> getGamesByTeam(String teamname) async {
    lineup.clear();
    lineup.add(_getGamesByTeam.call(teamname));
  }

  @action
  Future<void> getAllTeams() async {
    teamNames.clear();
    teamNames.addAll(_getAllTeams.call());
  }

  @action
  Future<void> setFavouriteTeam(String favourite) async {
    _setFavouriteTeam.call(favourite);
  }

  @action
  Future<void> changeSubmitButtonText(String text) async {
    submitButton = text.obs();
  }

  @action
  Future<void> changeSwitchButton(bool value) async {
    switchButton.value = value;
  }
}
