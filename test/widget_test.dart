import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petz/main.dart';

void main() {
  testWidgets('Tela de Login aparece corretamente', (WidgetTester tester) async {
    // Monta o app
    await tester.pumpWidget(PetApp());

    // Verifica se o título "PetCare" aparece
    expect(find.text("PetCare"), findsOneWidget);

    // Verifica se os campos de e-mail e senha existem
    expect(find.byType(TextField), findsNWidgets(2));

    // Verifica se o botão "Entrar" existe
    expect(find.text("Entrar"), findsOneWidget);

    // Verifica se os botões de navegação estão na tela
    expect(find.text("Cadastro de Usuário"), findsOneWidget);
    expect(find.text("Esqueci minha senha"), findsOneWidget);
  });
}
