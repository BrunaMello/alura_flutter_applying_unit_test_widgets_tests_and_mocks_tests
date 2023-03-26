import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My widget has a text "Spent', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets('Find a linear progressive indicator', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('find a AccountStatus', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));
    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });

  testWidgets('find 5 BoxCards', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });
}