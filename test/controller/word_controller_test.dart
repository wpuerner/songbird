import 'package:flutter_test/flutter_test.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/controller/word_settings_loader.dart';
import 'package:songassociation/model/word.dart';

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
    List<Word> mockWordList = List<Word>();
    mockWordList.add(mockWord);
    WordSettingsLoader().globalWordList = mockWordList;
  });

  group('Initialization tests', () {
    test('Words are placed in unplayedWordsQueue', () {
      WordController().wordCountPerRound = 2;
      WordController().initialize();
      expect(WordController().unplayedWordsQueue.length, equals(2));
      expect(WordController().playedWordsQueue.length, equals(0));
      expect(WordController().wordResultsQueue.length, equals(0));
    });

    test('Example song and artist are included in Word object', () {
      WordController().wordCountPerRound = 1;
      WordController().initialize();
      Word result = WordController().unplayedWordsQueue.removeFirst();
      expect(result.examples[0].songName, equals(MOCK_SONG_NAME));
      expect(result.examples[0].artistName, equals(MOCK_ARTIST_NAME));
    });
  });

  group('Queue tests', () {
    test('Unplayed words queue is empty when all words are played', () {
      WordController().wordCountPerRound = 3;
      WordController().initialize();
      while(WordController().isNextWordAvailable()) {
        WordController().getNextWord();
      }
      expect(WordController().unplayedWordsQueue.length, equals(0));
    });

    test('Played words results queues are full when all words played', () {
      WordController().wordCountPerRound = 3;
      WordController().initialize();
      while(WordController().isNextWordAvailable()) {
        WordController().submitWordResult(true);
        WordController().getNextWord();
      }
      expect(WordController().playedWordsQueue.length, equals(3));
      expect(WordController().wordResultsQueue.length, equals(3));
    });

    test('Queue order is maintained for results', () {
      WordController().wordCountPerRound = 5;
      WordController().initialize();
      var prescribedResults = [true, false, true, false, false];
      for(bool result in prescribedResults) {
        WordController().getNextWord();
        WordController().submitWordResult(result);
      }
      for(bool result in prescribedResults) {
        expect(WordController().wordResultsQueue.removeFirst(), equals(result));
      }
    });
  });

  group('Get next word tests', () {
    test('Get next word returns the next word', () {
      WordController().wordCountPerRound = 1;
      WordController().initialize();
      expect(WordController().getNextWord(), equals(MOCK_WORD));
    });

    test('Word list loops to start of configuration', () {
      WordController().wordCountPerRound = 2;
      WordController().initialize();
      WordController().getNextWord();  //cycle the word so we get the second one
      expect(WordController().isNextWordAvailable(), equals(true));
      expect(WordController().getNextWord(), equals(MOCK_WORD));
    });

    test('Return next word not available when the words queue is empty', () {
      WordController().wordCountPerRound = 1;
      WordController().initialize();
      WordController().getNextWord();
      expect(WordController().isNextWordAvailable(), equals(false));
    });
  });

  group('Results tests', () {
    test('Calculate number correct for round', () {
      WordController().wordCountPerRound = 5;
      WordController().initialize();
      var prescribedResults = [true, false, true, false, false];
      for(bool result in prescribedResults) {
        WordController().getNextWord();
        WordController().submitWordResult(result);
      }
      expect(WordController().getNumberCorrectForRound(), equals(2));
      expect(WordController().wordResultsQueue.length, equals(5));
    });
  });
}

