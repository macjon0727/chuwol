import 'package:chuwol_app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CHUWOL app starts on login screen', (tester) async {
    await tester.pumpWidget(const ChuwolApp());
    await tester.pumpAndSettle();

    expect(find.text('CHUWOL'), findsOneWidget);
    expect(find.text('게스트로 둘러보기'), findsOneWidget);
  });
}
