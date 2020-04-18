import 'package:songassociation/controller/word_controller.dart';
import 'package:global_configuration/global_configuration.dart';

import 'package:songassociation/model/word.dart';

import 'package:flutter_test/flutter_test.dart';

const MOCK_WORD = "mockWord";
const MOCK_SONG_NAME = "mockSongName";
const MOCK_ARTIST_NAME = "mockArtistName";

void main() {

  setUp(() {
    Word mockWord = Word();
    mockWord.word = MOCK_WORD;
    mockWord.examples = List<Example>();
    mockWord.examples.add(Example());
    mockWord.examples[0].songName = MOCK_SONG_NAME;
    mockWord.examples[0].artistName = MOCK_ARTIST_NAME;
    Map<String, List<Word>> mockWordSettings = {
      "words": [mockWord]
    };
    GlobalConfiguration().loadFromMap(mockWordSettings);
  });

  group('WordController initialization tests', () {
    test('Initialized word list should contain valid data', () {
      WordController().initialize(1);
      expect(WordController().words[0].examples[0].songName, equals(MOCK_SONG_NAME));
      expect(WordController().words[0].examples[0].artistName, equals(MOCK_ARTIST_NAME));
    });

    test('Word list loops to start of configuration', () {
      WordController().initialize(2);
      expect(WordController().words[1].examples[0].songName, equals(MOCK_SONG_NAME));
    });
  });

  test('WordController returns next word', () {
    WordController().initialize(1);
    final word = WordController().getNextWord();
    expect(word.examples[0].songName, equals(MOCK_SONG_NAME));
  });
}

