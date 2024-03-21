class PlayerModel {
  late String displayName;
  late int age;

  PlayerModel({required this.displayName});
  PlayerModel.empty() {
    PlayerModel(displayName: '');
  }
}
