import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/presentation/widgets/GameAddWidget.dart';

part 'GameStore.g.dart';

// TODO: consider private or public see MainStore
// ignore: library_private_types_in_public_api
class GameStore = _GameStore with _$GameStore;

abstract class _GameStore with Store {
  @observable
  Observable<int> dialogIndex = DialogState.gameInfo.index.obs();

  @observable
  Observable<String> submitButton = 'Next'.obs();

  @observable
  Observable<bool> switchButton = false.obs();

  @action
  Future<void> changeSubmitButtonText(String text) async {
    submitButton = text.obs();
  }

  @action
  Future<void> changeSwitchButton(bool value) async {
    switchButton.value = value;
  }
}
