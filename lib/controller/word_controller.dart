import 'dart:collection';
import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';

import '../model/word.dart';

class WordController {

  //singleton instance, with factory and constructor
  static final WordController _instance = WordController._internal();

  factory WordController() {
    return _instance;
  }

  WordController._internal();

  List<Word> words = List<Word>();

  Queue<Word> wordQueue;

  int numberCorrect;

  int wordDurationInSeconds;

  int wordCountPerRound;

  void initialize() {
    //get configuration from file and generate word list and queue
    final dynamicGlobalWordList = GlobalConfiguration().get("words");
    final globalWordList = dynamicGlobalWordList.map((i) => Word.fromJson(i)).toList();

    int _m = 0;
    words.clear();

    for (int _i = 0; _i < wordCountPerRound; _i++) {
      if (_m >= globalWordList.length) {
        _m = 0;
      }
      words.add(globalWordList[_m]);
      _m++;
    }

    wordQueue = Queue.of(words);

    numberCorrect = 0;
  }

  String getNextWord() {
    //pop the queue to get the next word
    return wordQueue.removeFirst().word;
  }

  bool isNextWordAvailable() {
    return wordQueue.isNotEmpty;
  }
}