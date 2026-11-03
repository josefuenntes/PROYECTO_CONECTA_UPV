import 'package:flutter/material.dart';

class CategoriaExplorar {
  final String titulo;
  final IconData icono;
  final Color colorFondo;
  final Color colorIcono;
  final String filtroClave;

  CategoriaExplorar({
    required this.titulo,
    required this.icono,
    required this.colorFondo,
    required this.colorIcono,
    required this.filtroClave,
  });
}

class ExplorarLogica extends ChangeNotifier {
  int _tabSeleccionada = 1; // Indice 1 corresponde a "Explorar"

  int get tabSeleccionada => _tabSeleccionada;

  // Lista de categorias de materias segun el prototipo
  final List<CategoriaExplorar> categorias = [
    CategoriaExplorar(
      titulo: 'Redes',
      icono: Icons.lan,
      colorFondo: const Color(0xFFEDE9FE),
      colorIcono: const Color(0xFF7C3AED),
      filtroClave: 'Redes',
    ),
    CategoriaExplorar(
      titulo: 'Bases de datos',
      icono: Icons.storage,
      colorFondo: const Color(0xFFD1FAE5),
      colorIcono: const Color(0xFF059669),
      filtroClave: 'Bases de datos',
    ),
    CategoriaExplorar(
      titulo: 'Calculo',
      icono: Icons.functions,
      colorFondo: const Color(0xFFFEF3C7),
      colorIcono: const Color(0xFFD97706),
      filtroClave: 'Calculo',
    ),
    CategoriaExplorar(
      titulo: 'Programacion',
      icono: Icons.terminal,
      colorFondo: const Color(0xFFEDE9FE),
      colorIcono: const Color(0xFF7C3AED),
      filtroClave: 'Programacion',
    ),
    CategoriaExplorar(
      titulo: 'Fisica',
      icono: Icons.science,
      colorFondo: const Color(0xFFD1FAE5),
      colorIcono: const Color(0xFF059669),
      filtroClave: 'Fisica',
    ),
    CategoriaExplorar(
      titulo: 'Ajedrez',
      icono: Icons.extension,
      colorFondo: const Color(0xFFEDE9FE),
      colorIcono: const Color(0xFF6B21A8),
      filtroClave: 'Ajedrez',
    ),
  ];

  // Navegar a la pantalla de Swipe filtrada por la materia elegida
  void seleccionarCategoria(BuildContext context, CategoriaExplorar categoria) {
    Navigator.pushNamed(
      context,
      '/swipe',
      arguments: {'filtroMateria': categoria.filtroClave},
    );
  }

  // Control de la barra de navegacion inferior
void cambiarTab(BuildContext context, int index) {
    if (_tabSeleccionada == index) return;
    _tabSeleccionada = index;
    notifyListeners();

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/swipe');
        break;
      case 1:
        // Ya estamos en Explorar
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chats_inicio'); //  Permite ir a Chats desde Explorar
        break;
      case 3:
      Navigator.pushReplacementNamed(context, '/perfil');
      break;    }
  }}