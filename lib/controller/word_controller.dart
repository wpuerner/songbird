import 'dart:collection';

import 'package:songassociation/controller/word_settings_loader.dart';

import '../model/word.dart';

class WordController {

  int wordDurationInSeconds;

  int wordCountPerRound;

  Word _currentWord;

  Queue<Word> unplayedWordsQueue = Queue();

  Queue<Word> playedWordsQueue = Queue();

  Queue<bool> wordResultsQueue = Queue();

  static final WordController _instance = WordController._internal();

  factory WordController() {
    return _instance;
  }

  WordController._internal();


  void initialize() {
   final globalWordList = WordSettingsLoader().loadGlobalWordList();

    int _m = 0;
    unplayedWordsQueue.clear();

    for (int _i = 0; _i < wordCountPerRound; _i++) {
      if (_m >= globalWordList.length) {
        _m = 0;
      }
      unplayedWordsQueue.add(globalWordList[_m]);
      _m++;
    }
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