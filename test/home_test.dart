import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {

  late MockBankHttp httpMock;

  setUp(() {
    httpMock = MockBankHttp();
  });

  testWidgets('My widget has a text "Spent', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));

    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets('Find a linear progressive indicator', (tester) async {
    when(httpMock.dolarToReal())
        .thenAnswer((_) async => ('LinearProgressIndicator'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('find a AccountStatus', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));

    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });

  testWidgets('find 5 BoxCards', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api: httpMock.dolarToReal()),
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

  testWidgets('When tap deposit should up load earned in 10', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));

    await tester.tap(find.text('Deposit'));

    await tester.tap(find.text('Earned'));

    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsOneWidget);
  });

  testWidgets('Testing MockHttp dolartoReal', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));

    verify(httpMock.dolarToReal()).called(1);
  });
}
