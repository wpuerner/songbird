import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/controller/word_settings_loader.dart';
import 'package:songassociation/model/word.dart';

import 'controller/word_controller_test.dart';

class TestUtils {

  static void initializeWordController(int wordCount, int wordDuration) {
    Word mockWord = Word();
    mockWord.word = MOCK_WORD;
    mockWord.examples = List<Example>();
    mockWord.examples.add(Example());
    mockWord.examples[0].songName = MOCK_SONG_NAME;
    mockWord.examples[0].artistName = MOCK_ARTIST_NAME;
    List<Word> mockWordList = List<Word>();
    mockWordList.add(mockWord);
    WordSettingsLoader().globalWordList = mockWordList;
    WordController().wordCountPerRound = wordCount;
    WordController().wordDurationInSeconds = wordDuration;
    WordController().initialize();
  }
}