import 'package:flutter/material.dart';
import 'package:tennis_club_app/presentation/localization/app_localizations.dart';

class DeleteWidget extends StatelessWidget {
  const DeleteWidget({super.key, required this.delete});
  final Function() delete;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.sure),
            content: null,
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text(AppLocalizations.of(context)!.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text(AppLocalizations.of(context)!.yes),
                  onPressed: () {
                    delete();
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
