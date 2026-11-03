import 'package:flutter/material.dart';

class IntroduccionLogica extends ChangeNotifier {
  bool _estaCargando = false;

  bool get estaCargando => _estaCargando;

  void irAIniciarSesion(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void irACrearCuenta(BuildContext context) {
    Navigator.pushNamed(context, '/registro');
  }
}