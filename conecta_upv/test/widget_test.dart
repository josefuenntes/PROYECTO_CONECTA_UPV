import 'package:flutter_test/flutter_test.dart';
import 'package:conecta_upv/main.dart';

void main() {
  testWidgets('Verificar inicio de Conecta UPV', (WidgetTester tester) async {
    // Carga la aplicación principal ConectaUpvApp
    await tester.pumpWidget(const ConectaUpvApp());

    // Verifica que el widget principal existe
    expect(find.byType(ConectaUpvApp), findsOneWidget);
  });
}