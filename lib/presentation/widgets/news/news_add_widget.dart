import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/stores/news_store.dart';
import 'package:tennis_club_app/presentation/localization/app_localizations.dart';

class NewsAddWidget extends StatelessWidget {
  NewsAddWidget({super.key});
  final NewsStore _newsStore = locator<NewsStore>();
  final MainStore _mainStore = locator<MainStore>();
  final TextEditingController datePickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) =>
                  {_newsStore.newNews.nonObservableValue.title = value},
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.title,
                hintText: AppLocalizations.of(context)!.titleHint,
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_newsStore.newNews.nonObservableValue.shortText = value},
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.shorttext,
                hintText: AppLocalizations.of(context)!.shorttextHint,
              ),
            ),
            TextField(
              onChanged: (value) =>
                  {_newsStore.newNews.nonObservableValue.content = value},
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.content,
                hintText: AppLocalizations.of(context)!.contentHint,
              ),
            ),
            TextField(
              controller: datePickerController
                ..text = Localization.formatDate(DateTime.now()),
              readOnly: true,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.selectDate),
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
              child: Text(AppLocalizations.of(context)!.addPicture),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () {
                if (_newsStore.newNews.nonObservableValue.title != '') {
                  _newsStore.addNews();
                  _newsStore.resetNews();
                  _newsStore.getNews();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(_mainStore.scaffoldKey.currentContext!)
                      .showSnackBar(SnackBar(
                          content: Text(
                              AppLocalizations.of(context)!.titleMissing)));
                }
              },
              child: Text(AppLocalizations.of(context)!.create),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            ElevatedButton(
              onPressed: () {
                _newsStore.resetNews();
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            )
          ],
        ),
      ),
    ));
  }

  onTapDateFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(DateTime.now().year + 1),
      firstDate: DateTime(DateTime.now().year - 1),
      initialDate: DateTime.now(),
      locale: Locale(language),
    );
    if (pickedDate == null) return;
    datePickerController.text = Localization.formatDate(pickedDate);
    _newsStore.newNews.nonObservableValue.date = DateTime.now().copyWith(
        year: pickedDate.year, month: pickedDate.month, day: pickedDate.day);
  }
}
