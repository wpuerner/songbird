import 'package:flutter_test/flutter_test.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/controller/word_settings_loader.dart';
import 'package:songassociation/model/word.dart';
import 'package:songassociation/screens/end/end.dart';
import 'package:songassociation/screens/end/word_result_box.dart';

import '../../test_constants.dart';

import 'package:flutter/material.dart';

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
    WordController().wordCountPerRound = 5;
    WordController().initialize();
    while(WordController().isNextWordAvailable()) {
      WordController().getNextWord();
      WordController().submitWordResult(true);
    }
  });

  testWidgets('Correct number of result boxes are displayed', (WidgetTester tester) async {
    await tester.pumpWidget(EndScreen());

    final resultBoxFinder = find.byType(WordResultBox);
    expect(resultBoxFinder, findsNWidgets(5));

    final restartButtonFinder = find.byKey(Key("restartButton"));
    expect(restartButtonFinder, findsOneWidget);

    final homeButtonFinder = find.byKey(Key("homeButton"));
    expect(homeButtonFinder, findsOneWidget);
  });

}