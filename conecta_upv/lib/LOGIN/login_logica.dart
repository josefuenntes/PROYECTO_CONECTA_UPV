import 'package:flutter/material.dart';

class LoginLogica extends ChangeNotifier {
  final TextEditingController correoController = TextEditingController(text: '2130048@upv.edu.mx');
  final TextEditingController passwordController = TextEditingController(text: 'politecnica2025');

  bool _ocultarPassword = true;
  bool _recordarDispositivo = true;
  bool _estaCargando = false;

  bool get ocultarPassword => _ocultarPassword;
  bool get recordarDispositivo => _recordarDispositivo;
  bool get estaCargando => _estaCargando;

  void alternarOcultarPassword() {
    _ocultarPassword = !_ocultarPassword;
    notifyListeners();
  }

  void alternarRecordarDispositivo(bool? valor) {
    _recordarDispositivo = valor ?? false;
    notifyListeners();
  }

  Future<void>procesarLogin(BuildContext context) async {
    final correo = correoController.text.trim();
    final password = passwordController.text;

    if (correo.isEmpty || password.isEmpty) {
      _mostrarMensaje(context, 'Por favor ingresa tu correo y contraseña', esError: true);
      return;
    }

    if (!correo.endsWith('@upv.edu.mx')) {
      _mostrarMensaje(context, 'Ingresa un correo institucional valido (@upv.edu.mx)', esError: true);
      return;
    }

    _estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1000));

    _estaCargando = false;
    notifyListeners();

    if (!context.mounted) return;

    _mostrarMensaje(context, '¡Bienvenido a ConectaUPV!');
    
// Cambia la ruta final del login a '/swipe'
Navigator.pushNamedAndRemoveUntil(context, '/swipe_inicio', (route) => false);  }

  void olvidePassword(BuildContext context) {
    _mostrarMensaje(context, 'Se han enviado instrucciones a tu correo institucional');
  }

  void irARegistro(BuildContext context) {
    Navigator.pushNamed(context, '/registro');
  }

// Redirige a la pantalla principal de INTRO sin importar el historial
  void irAIntro(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/', // Ruta principal de INTRO
      (route) => false,
    );
  }
  void _mostrarMensaje(BuildContext context, String mensaje, {bool esError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: esError ? const Color(0xFFBA1A1A) : const Color(0xFF059669),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    correoController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}