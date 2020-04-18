import 'dart:collection';

import 'package:global_configuration/global_configuration.dart';

import '../model/word.dart';

class WordController {

  //singleton instance, with factory and constructor
  static final WordController _instance = WordController._internal();

  factory WordController() {
    return _instance;
  }

  WordController._internal();

  Queue<Word> unplayedWordsQueue;

  Queue<Word> playedWordsQueue;

  Queue<bool> wordResultsQueue;


  int numberCorrect;

  int wordDurationInSeconds;

  int wordCountPerRound;

  Word _currentWord;

  void initialize() {
    //get configuration from file and generate word list and queue
    final dynamicGlobalWordList = GlobalConfiguration().get("words");
    final globalWordList = dynamicGlobalWordList.map((i) => Word.fromJson(i)).toList();

    int _m = 0;
    unplayedWordsQueue.clear();


    for (int _i = 0; _i < wordCountPerRound; _i++) {
      if (_m >= globalWordList.length) {
        _m = 0;
      }
      unplayedWordsQueue.add(globalWordList[_m]);
      _m++;
    }

    numberCorrect = 0;
  }

  String getNextWord() {
    _currentWord = unplayedWordsQueue.removeFirst();
    return _currentWord.word;
  }

  void submitWordResult(bool gotIt) {
    playedWordsQueue.add(_currentWord);
    wordResultsQueue.add(gotIt);
  }

  bool isNextWordAvailable() {
    return unplayedWordsQueue.isNotEmpty;
  }
}