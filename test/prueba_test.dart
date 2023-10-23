import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hola/Hola.dart';
import 'package:hola/main.dart'; // Asegúrate de que la ruta sea correcta

void main() {
  testWidgets('LoginForm widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verifica que el widget "LoginForm" esté en pantalla.
    expect(find.byType(LoginForm), findsOneWidget);

    // Realiza una serie de pruebas en los widgets dentro de LoginForm.
    // Por ejemplo, puedes verificar que los campos de texto estén visibles.
    expect(find.byType(TextField), findsNWidgets(2));

    // Simula una interacción de toque en un widget, por ejemplo, un botón personalizado.
    await tester.tap(find.widgetWithText(CustomButton, 'Iniciar Sesión'));
    await tester.pump();

    // Verifica que se ha navegado a la pantalla HolaScreen.
    expect(find.byType(HolaScreen), findsOneWidget);
  });
}
