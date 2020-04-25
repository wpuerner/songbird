import 'package:global_configuration/global_configuration.dart';

import '../model/word.dart';


class WordSettingsLoader {

  var globalWordList;

  static final WordSettingsLoader _instance = WordSettingsLoader._internal();

  factory WordSettingsLoader() {
    return _instance;
  }

  WordSettingsLoader._internal();

  List<dynamic> loadGlobalWordList() {
    if(null == globalWordList) {
      final dynamicGlobalWordList = GlobalConfiguration().get("words");
      globalWordList = dynamicGlobalWordList.map((i) => Word.fromJson(i)).toList();
    }
    return globalWordList;
  }

}