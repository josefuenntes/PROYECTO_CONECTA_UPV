import 'package:flutter/material.dart';

/// Modelo de datos para representar a un estudiante con match o conversación activa
class ModeloChat {
  final String id;
  final String nombre;
  final String carrera;
  final String imagenUrl;
  final String ultimoMensaje;
  final String hora;
  final int mensajesNoLeidos;
  final bool esNuevoMatch; // Si es true, aparece en la barra horizontal de Nuevos Matches
  final bool estaEnLinea;  // Indicador verde/azul de estado en línea

  ModeloChat({
    required this.id,
    required this.nombre,
    required this.carrera,
    required this.imagenUrl,
    this.ultimoMensaje = '',
    this.hora = '',
    this.mensajesNoLeidos = 0,
    this.esNuevoMatch = false,
    this.estaEnLinea = false,
  });
}

class ChatsInicioLogica extends ChangeNotifier {
  int _tabSeleccionada = 2; // Pestaña 'Chats' seleccionada por defecto
  String _filtroBusqueda = '';

  // 🔹 Lista dinámica de Nuevos Matches (Nuevos perfiles donde hubo coincidencia)
  final List<ModeloChat> _nuevosMatches = [
    ModeloChat(
      id: 'm1',
      nombre: 'Andrea',
      carrera: 'Ing. Industrial',
      imagenUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&q=80&w=400',
      esNuevoMatch: true,
      estaEnLinea: true,
    ),
    ModeloChat(
      id: 'm2',
      nombre: 'Carlos',
      carrera: 'Ing. Mecatrónica',
      imagenUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&q=80&w=400',
      esNuevoMatch: true,
      estaEnLinea: true,
    ),
    ModeloChat(
      id: 'm3',
      nombre: 'Elena',
      carrera: 'Ing. Tecnologías de la Información',
      imagenUrl: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&q=80&w=400',
      esNuevoMatch: true,
      estaEnLinea: false,
    ),
    ModeloChat(
      id: 'm4',
      nombre: 'Diego',
      carrera: 'Ing. Sistemas Automotrices',
      imagenUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=400',
      esNuevoMatch: true,
      estaEnLinea: false,
    ),
  ];

  // 🔹 Lista de Conversaciones Activas
  final List<ModeloChat> _conversaciones = [
    ModeloChat(
      id: 'c1',
      nombre: 'Jose',
      carrera: 'Ing. Tecnologías de la Información',
      imagenUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=400',
      ultimoMensaje: 'hola puedo reunirme a las 10 am',
      hora: '10:14 AM',
      mensajesNoLeidos: 0,
      estaEnLinea: true,
    ),
    ModeloChat(
      id: 'c2',
      nombre: 'Maria',
      carrera: 'Ing. Industrial',
      imagenUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=400',
      ultimoMensaje: 'Ya supe como integrar!!',
      hora: 'Ayer',
      mensajesNoLeidos: 1,
      estaEnLinea: true,
    ),
    ModeloChat(
      id: 'c3',
      nombre: 'Mateo',
      carrera: 'Ing. Mecatrónica',
      imagenUrl: 'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&q=80&w=400',
      ultimoMensaje: 'Dale, te paso el repo de Python en un rato',
      hora: 'Lun',
      mensajesNoLeidos: 0,
      estaEnLinea: false,
    ),
    ModeloChat(
      id: 'c4',
      nombre: 'Sofia',
      carrera: 'Ing. Tecnologías de la Información',
      imagenUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=400',
      ultimoMensaje: '¿Vienes a la biblioteca de la UPV?',
      hora: 'Lun',
      mensajesNoLeidos: 0,
      estaEnLinea: false,
    ),
  ];

  // Getters
  int get tabSeleccionada => _tabSeleccionada;
  String get filtroBusqueda => _filtroBusqueda;

  // Filtrado dinámico por buscador
  List<ModeloChat> get nuevosMatchesFiltrados {
    if (_filtroBusqueda.isEmpty) return _nuevosMatches;
    return _nuevosMatches
        .where((m) => m.nombre.toLowerCase().contains(_filtroBusqueda.toLowerCase()))
        .toList();
  }

  List<ModeloChat> get conversacionesFiltradas {
    if (_filtroBusqueda.isEmpty) return _conversaciones;
    return _conversaciones.where((c) =>
        c.nombre.toLowerCase().contains(_filtroBusqueda.toLowerCase()) ||
        c.ultimoMensaje.toLowerCase().contains(_filtroBusqueda.toLowerCase())).toList();
  }

  bool get hayMatches => nuevosMatchesFiltrados.isNotEmpty;
  bool get hayConversaciones => conversacionesFiltradas.isNotEmpty;

  // Actualizar el texto del buscador
  void actualizarBusqueda(String query) {
    _filtroBusqueda = query;
    notifyListeners();
  }

  void limpiarBusqueda() {
    _filtroBusqueda = '';
    notifyListeners();
  }

  // Método para cambiar de pestaña en el menú inferior
void cambiarTab(BuildContext context, int index) {
    if (_tabSeleccionada == index) return;
    _tabSeleccionada = index;
    notifyListeners();

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/swipe'); //  Permite volver a Swipe
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/explorar'); //  Permite ir a Explorar
        break;
      case 2:
        // Ya estamos en Chats
        break;
case 3:
  Navigator.pushReplacementNamed(context, '/perfil');
  break;    }
  }
  // 🔹 Abrir la conversación seleccionada (Paso 2)
  void abrirChat(BuildContext context, ModeloChat chat) {
    Navigator.pushNamed(context, '/chats_conecta2', arguments: chat);
  }
}