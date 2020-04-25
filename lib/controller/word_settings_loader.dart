import 'package:global_configuration/global_configuration.dart';

import '../model/word.dart';


class WordSettingsLoader {

  List<Word> globalWordList;

  static final WordSettingsLoader _instance = WordSettingsLoader._internal();

  factory WordSettingsLoader() {
    return _instance;
  }

  WordSettingsLoader._internal();

  List<Word> loadGlobalWordList() {
    if(null == globalWordList) {
      final dynamicGlobalWordList = GlobalConfiguration().get("words");
      globalWordList = dynamicGlobalWordList.map((i) => Word.fromJson(i)).toList();
    }
    return globalWordList;
  }

}