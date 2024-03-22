import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/NewsStore.dart';

class NewsAddWidget extends StatelessWidget {
  NewsAddWidget({super.key});
  final NewsStore _newsStore = locator<NewsStore>();
  TextEditingController datePickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) =>
                  {_newsStore.newNews.nonObservableValue.title = value},
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter a title',
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_newsStore.newNews.nonObservableValue.shortText = value},
              decoration: const InputDecoration(
                labelText: 'Short text',
                hintText: 'Enter your short text',
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_newsStore.newNews.nonObservableValue.content = value},
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Content',
                hintText: 'Enter your content',
              ),
            ),
            TextField(
              controller: datePickerController
                ..text = Localization.formatDate(DateTime.now()),
              readOnly: true,
              decoration: const InputDecoration(hintText: "Select Date"),
              onTap: () => onTapDateFunction(context: context),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () async {
                ImagePicker picker = ImagePicker();
                XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                final Uint8List bytes = await image!.readAsBytes();
                FirebaseConnection.uploadImage(bytes, image.name);
                _newsStore.newNews.nonObservableValue.preview = image.name;
              },
              child: const Text('Add picture'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () {
                _newsStore.addNews();
                _newsStore.resetNews();
                _newsStore.getNews();
                Navigator.pop(context);
              },
              child: const Text('Create'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            )
          ],
        ),
      ),
    )));
  }

  onTapDateFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(DateTime.now().year + 1),
      firstDate: DateTime(DateTime.now().year - 1),
      initialDate: DateTime.now(),
      locale: const Locale('de', 'DE'),
    );
    if (pickedDate == null) return;
    datePickerController.text = Localization.formatDate(pickedDate);
    _newsStore.newNews.nonObservableValue.date = DateTime.now().copyWith(
        year: pickedDate.year, month: pickedDate.month, day: pickedDate.day);
  }
}
