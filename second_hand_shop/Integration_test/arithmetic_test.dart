import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:second_hand_shop/Authentication/login.dart';
import 'package:second_hand_shop/Authentication/registration.dart';
import 'package:second_hand_shop/navigationdrawer.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("login", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/nav': (context) => const DashboardScreen(),
      },
      home: const MyLogin(),
    ));
    Finder email = find.byKey(const ValueKey("email"));
    await tester.enterText(email, "admin");
    Finder password = find.byKey(const ValueKey("password"));
    await tester.enterText(password, "admin");
    Finder login = find.byKey(const ValueKey("login"));
    await tester.tap(login);
    await tester.pumpAndSettle();
    expect(find.text('Second hand shop'), findsOneWidget);
  });

  testWidgets("register", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/nav': (context) => const DashboardScreen(),
      },
      home: const MyRegister(),
    ));
    Finder name = find.byKey(const ValueKey("name"));
    await tester.enterText(name, "manjil");
    Finder number = find.byKey(const ValueKey("number"));
    await tester.enterText(number, "9862046166");
    Finder email = find.byKey(const ValueKey("email"));
    await tester.enterText(email, "9862046166");
    Finder password = find.byKey(const ValueKey("password"));
    await tester.enterText(password, "9862046166");
    Finder btnsignup = find.byKey(const ValueKey("btnsignup"));
    await tester.tap(btnsignup);
    await tester.pumpAndSettle();
    expect(find.text('Result:30'), findsOneWidget);
  });
}
