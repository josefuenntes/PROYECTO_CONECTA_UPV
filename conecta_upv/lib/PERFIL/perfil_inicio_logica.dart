import 'package:flutter/material.dart';

class PerfilInicioLogica extends ChangeNotifier {
  int _tabSeleccionada = 3;
  int get tabSeleccionada => _tabSeleccionada;

  // Estados desplegables de la sección "Acerca de mí"
  bool sobreMiAbierto = true;
  bool aprenderAbierto = false;
  bool ensenarAbierto = false;

  void toggleSobreMi() {
    sobreMiAbierto = !sobreMiAbierto;
    notifyListeners();
  }

  void toggleAprender() {
    aprenderAbierto = !aprenderAbierto;
    notifyListeners();
  }

  void toggleEnsenar() {
    ensenarAbierto = !ensenarAbierto;
    notifyListeners();
  }

  // 🔹 Navegación libre de la barra inferior
  void cambiarTab(BuildContext context, int index) {
    if (_tabSeleccionada == index) return;
    _tabSeleccionada = index;
    notifyListeners();

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/swipe');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/explorar');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chats');
        break;
      case 3:
        // Ya estamos en Perfil
        break;
    }
  }

  // 🔹 Cerrar Sesión y regresar a la pantalla de Introducción (Intro)
  void cerrarSesion(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro de que deseas salir de ConectaUPV?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFBA1A1A),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: const Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
  }
}