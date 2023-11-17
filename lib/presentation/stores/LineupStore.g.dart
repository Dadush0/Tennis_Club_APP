// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LineupStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LineupStore on _LineupStore, Store {
  late final _$lineupAtom = Atom(name: '_LineupStore.lineup', context: context);

  @override
  ObservableList<TeamModel> get lineup {
    _$lineupAtom.reportRead();
    return super.lineup;
  }

  @override
  set lineup(ObservableList<TeamModel> value) {
    _$lineupAtom.reportWrite(value, super.lineup, () {
      super.lineup = value;
    });
  }

  late final _$customTileExpandedAtom =
      Atom(name: '_LineupStore.customTileExpanded', context: context);

  @override
  Observable<bool> get customTileExpanded {
    _$customTileExpandedAtom.reportRead();
    return super.customTileExpanded;
  }

  @override
  set customTileExpanded(Observable<bool> value) {
    _$customTileExpandedAtom.reportWrite(value, super.customTileExpanded, () {
      super.customTileExpanded = value;
    });
  }

  late final _$getLineupAsyncAction =
      AsyncAction('_LineupStore.getLineup', context: context);

  @override
  Future<void> getLineup() {
    return _$getLineupAsyncAction.run(() => super.getLineup());
  }

  late final _$getGamesByTeamAsyncAction =
      AsyncAction('_LineupStore.getGamesByTeam', context: context);

  @override
  Future<void> getGamesByTeam(String teamname) {
    return _$getGamesByTeamAsyncAction
        .run(() => super.getGamesByTeam(teamname));
  }

  late final _$getAllTeamsAsyncAction =
      AsyncAction('_LineupStore.getAllTeams', context: context);

  @override
  Future<void> getAllTeams() {
    return _$getAllTeamsAsyncAction.run(() => super.getAllTeams());
  }

  @override
  String toString() {
    return '''
lineup: ${lineup},
customTileExpanded: ${customTileExpanded}
    ''';
  }
}
