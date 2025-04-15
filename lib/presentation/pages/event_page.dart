import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/widgets/event/event_add_widget.dart';
import 'package:tennis_club_app/presentation/widgets/event/event_widget.dart';
import 'package:tennis_club_app/presentation/localization/app_localizations.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});
  final MainStore _mainStore = locator<MainStore>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(language),
      home: Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical, child: EventWidget()),
        floatingActionButton: Observer(
          builder: (context) => Visibility(
              visible: _mainStore.adminView.value,
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext context) => EventAddWidget()));
                },
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('de'), Locale('en')],
    );
  }
}
