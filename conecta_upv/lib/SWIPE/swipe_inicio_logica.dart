import 'package:flutter/material.dart';

class ElementoMateria {
  final String titulo;
  final IconData icono;

  ElementoMateria({required this.titulo, required this.icono});
}

class PerfilEstudiante {
  final String id;
  final String nombre;
  final int edad;
  final String carrera;
  final String imagenUrl;
  final List<ElementoMateria> buscoAprender;
  final List<ElementoMateria> puedoEnsenar;

  PerfilEstudiante({
    required this.id,
    required this.nombre,
    required this.edad,
    required this.carrera,
    required this.imagenUrl,
    required this.buscoAprender,
    required this.puedoEnsenar,
  });
}

class SwipeLogica extends ChangeNotifier {
  int _indiceActual = 0;
  int _tabSeleccionada = 0;

  // Cierra la sesión y regresa a la pantalla de Login
  void cerrarSesion(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }


  // 🔹 Variable para guardar el filtro seleccionado desde Explorar
  String? _filtroMateria;

  // Lista dinamica de perfiles para la tarjeta Swipe
  final List<PerfilEstudiante> _perfiles = [
    PerfilEstudiante(
      id: '1',
      nombre: 'Valeria Gomez',
      edad: 20,
      carrera: 'Ingenieria en Tecnologias de la Informacion',
      imagenUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=800',
      buscoAprender: [
        ElementoMateria(titulo: 'Calculo', icono: Icons.functions),
        ElementoMateria(titulo: 'Programacion', icono: Icons.terminal),
        ElementoMateria(titulo: 'Redes', icono: Icons.lan),
      ],
      puedoEnsenar: [
        ElementoMateria(titulo: 'Bases de datos', icono: Icons.storage),
        ElementoMateria(titulo: 'Fisica', icono: Icons.bolt),
        ElementoMateria(titulo: 'Ajedrez', icono: Icons.sports_esports),
      ],
    ),
    PerfilEstudiante(
      id: '2',
      nombre: 'Carlos Mendoza',
      edad: 21,
      carrera: 'Ingenieria Mecatronica',
      imagenUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&q=80&w=800',
      buscoAprender: [
        ElementoMateria(titulo: 'Bases de datos', icono: Icons.storage),
        ElementoMateria(titulo: 'Ingles', icono: Icons.language),
        ElementoMateria(titulo: 'Circuitos', icono: Icons.memory),
      ],
      puedoEnsenar: [
        ElementoMateria(titulo: 'Calculo', icono: Icons.functions),
        ElementoMateria(titulo: 'Robotica', icono: Icons.smart_toy),
        ElementoMateria(titulo: 'Fisica', icono: Icons.bolt),
      ],
    ),
    PerfilEstudiante(
      id: '3',
      nombre: 'Sofia Ramirez',
      edad: 19,
      carrera: 'Ingenieria Industrial',
      imagenUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&q=80&w=800',
      buscoAprender: [
        ElementoMateria(titulo: 'Programacion', icono: Icons.terminal),
        ElementoMateria(titulo: 'Diseno UX', icono: Icons.palette),
        ElementoMateria(titulo: 'Estadistica', icono: Icons.bar_chart),
      ],
      puedoEnsenar: [
        ElementoMateria(titulo: 'Ingles', icono: Icons.language),
        ElementoMateria(titulo: 'Administracion', icono: Icons.business_center),
        ElementoMateria(titulo: 'Redaccion', icono: Icons.edit_note),
      ],
    ),
  ];

  // 🔹 Getter para obtener únicamente la lista de perfiles que coinciden con el filtro
  List<PerfilEstudiante> get perfilesVisibles {
    if (_filtroMateria == null || _filtroMateria!.isEmpty) {
      return _perfiles;
    }
    return _perfiles.where((perfil) {
      return perfil.puedoEnsenar.any(
        (materia) => materia.titulo.toLowerCase().contains(_filtroMateria!.toLowerCase()),
      );
    }).toList();
  }

  // 🔹 Retorna el perfil actual tomando en cuenta si hay filtro aplicado
  PerfilEstudiante? get perfilActual {
    final lista = perfilesVisibles;
    return _indiceActual < lista.length ? lista[_indiceActual] : null;
  }

  int get tabSeleccionada => _tabSeleccionada;
  bool get hayMasPerfiles => _indiceActual < perfilesVisibles.length;

// Cambia la pestaña e invoca la navegacion de pantalla
void cambiarTab(BuildContext context, int index) {
    if (_tabSeleccionada == index) return;
    _tabSeleccionada = index;
    notifyListeners();

    switch (index) {
      case 0:
        // Ya estamos en Swipe
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/explorar');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chats_inicio');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/perfil');
        break;  
        
      }
  }  void filtrarPorMateria(String materia) {
    _filtroMateria = materia;
    _indiceActual = 0;
    notifyListeners();
  }

  void rechazarPerfil() {
    if (_indiceActual < perfilesVisibles.length) {
      _indiceActual++;
      notifyListeners();
    }
  }

  void aceptarPerfil(BuildContext context) {
    if (_indiceActual < perfilesVisibles.length) {
      final perfil = perfilesVisibles[_indiceActual];
      _indiceActual++;
      notifyListeners();
      _mostrarDialogoMatch(context, perfil);
    }
  }

  void reiniciarPerfiles() {
    _indiceActual = 0;
    _filtroMateria = null;
    notifyListeners();
  }

  void _mostrarDialogoMatch(BuildContext context, PerfilEstudiante perfil) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: const [
            Icon(Icons.stars, color: Color(0xFF7C3AED)),
            SizedBox(width: 8),
            Text('¡Es un Match! 🎉', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(
          'Tus materias de interés coinciden con lo que ${perfil.nombre} puede enseñar. ¿Deseas iniciar un chat de estudio?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Luego'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Enviar mensaje', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}