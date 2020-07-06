import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/screens/end/end.dart';
import 'package:songassociation/screens/play/play.dart';

import '../../test_utils.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  NavigatorObserver mockObserver;

  PlayScreen subject = new PlayScreen();

  setUp(() {
    mockObserver = MockNavigatorObserver();
    TestUtils.initializeWordController(2, 2);
  });

  Future _pumpPlayScreen(WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: PlayScreen(), navigatorObservers: [mockObserver]));
  }

  Future _tapGotItButton(WidgetTester tester) async {
    await tester.tap(find.byKey(Key("gotItButton")));
    await tester.pumpAndSettle();
  }

  group('Play screen result tests', () {
    testWidgets('Got it button adds correct result',
        (WidgetTester tester) async {
      await _pumpPlayScreen(tester);
      await _tapGotItButton(tester);

      expect(WordController().wordResultsQueue.length, equals(1));
      expect(WordController().wordResultsQueue.removeFirst(), equals(true));
    });

    testWidgets('Time running out add the correct result',
        (WidgetTester tester) async {
      await _pumpPlayScreen(tester);
      await tester.pump(new Duration(seconds: 3));
      expect(WordController().wordResultsQueue.length, equals(1));
      expect(WordController().wordResultsQueue.removeFirst(), equals(false));
    });
  });

  group('Play screen navigation tests', () {
    testWidgets('When words are available to play, route to play screen',
        (WidgetTester tester) async {
      await _pumpPlayScreen(tester);
      await _tapGotItButton(tester);

      verify(mockObserver.didPush(any, any));
      expect(find.byType(PlayScreen), findsOneWidget);
    });

    testWidgets('When no words are available, route to end screen',
        (WidgetTester tester) async {
      TestUtils.initializeWordController(1, 1);
      await _pumpPlayScreen(tester);
      await _tapGotItButton(tester);

      verify(mockObserver.didPush(any, any));
      expect(find.byType(EndScreen), findsOneWidget);
    });
  });
}
