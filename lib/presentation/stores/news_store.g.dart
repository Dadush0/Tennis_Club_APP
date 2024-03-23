// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsStore on _NewsStore, Store {
  late final _$newsModelAtom =
      Atom(name: '_NewsStore.newsModel', context: context);

  @override
  ObservableList<NewsModel> get newsModel {
    _$newsModelAtom.reportRead();
    return super.newsModel;
  }

  @override
  set newsModel(ObservableList<NewsModel> value) {
    _$newsModelAtom.reportWrite(value, super.newsModel, () {
      super.newsModel = value;
    });
  }

  late final _$newNewsAtom = Atom(name: '_NewsStore.newNews', context: context);

  @override
  Observable<NewsModel> get newNews {
    _$newNewsAtom.reportRead();
    return super.newNews;
  }

  @override
  set newNews(Observable<NewsModel> value) {
    _$newNewsAtom.reportWrite(value, super.newNews, () {
      super.newNews = value;
    });
  }

  late final _$getNewsAsyncAction =
      AsyncAction('_NewsStore.getNews', context: context);

  @override
  Future<void> getNews() {
    return _$getNewsAsyncAction.run(() => super.getNews());
  }

  late final _$_NewsStoreActionController =
      ActionController(name: '_NewsStore', context: context);

  @override
  void setNews(NewsModel newsModel) {
    final _$actionInfo =
        _$_NewsStoreActionController.startAction(name: '_NewsStore.setNews');
    try {
      return super.setNews(newsModel);
    } finally {
      _$_NewsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newsModel: ${newsModel},
newNews: ${newNews}
    ''';
  }
}
