// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventStore on _EventStore, Store {
  late final _$eventModelAtom =
      Atom(name: '_EventStore.eventModel', context: context);

  @override
  ObservableList<EventModel> get eventModel {
    _$eventModelAtom.reportRead();
    return super.eventModel;
  }

  @override
  set eventModel(ObservableList<EventModel> value) {
    _$eventModelAtom.reportWrite(value, super.eventModel, () {
      super.eventModel = value;
    });
  }

  late final _$newEventAtom =
      Atom(name: '_EventStore.newEvent', context: context);

  @override
  Observable<EventModel> get newEvent {
    _$newEventAtom.reportRead();
    return super.newEvent;
  }

  @override
  set newEvent(Observable<EventModel> value) {
    _$newEventAtom.reportWrite(value, super.newEvent, () {
      super.newEvent = value;
    });
  }

  late final _$getEventsAsyncAction =
      AsyncAction('_EventStore.getEvents', context: context);

  @override
  Future<void> getEvents() {
    return _$getEventsAsyncAction.run(() => super.getEvents());
  }

  late final _$_EventStoreActionController =
      ActionController(name: '_EventStore', context: context);

  @override
  void setEvents(EventModel eventModel) {
    final _$actionInfo = _$_EventStoreActionController.startAction(
        name: '_EventStore.setEvents');
    try {
      return super.setEvents(eventModel);
    } finally {
      _$_EventStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventModel: ${eventModel},
newEvent: ${newEvent}
    ''';
  }
}
