import 'package:flutter/material.dart';

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
            title: const Text('Are you sure?'),
            content: null,
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text('Yes'),
                  onPressed: () {
                    delete();
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
