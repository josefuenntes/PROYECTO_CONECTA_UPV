import 'package:flutter/material.dart';

class BienvenidaRegistroLogica extends ChangeNotifier {
  // Datos dinamicos del estudiante
  String nombre = 'Estudiante';
  String apellidos = '';
  String correo = 'usuario@upv.edu.mx';
  String carrera = 'Ingenieria en Tecnologias de la Informacion';
  String rolUniversitario = 'Estudiante & Tutor';

  bool _estaCargando = false;
  bool get estaCargando => _estaCargando;

  // Cargar datos pasados desde el resumen o registro
  void cargarDatos(Map<String, dynamic>? datos) {
    if (datos == null) return;

    nombre = datos['nombre'] ?? nombre;
    apellidos = datos['apellidos'] ?? apellidos;
    correo = datos['correo'] ?? correo;
    carrera = datos['carrera'] ?? carrera;

    // Determinar rol segun si tiene habilidades registradas para ensenar
    final puedoEnsenar = datos['puedoEnsenar'];
    if (puedoEnsenar != null && (puedoEnsenar as List).isNotEmpty) {
      rolUniversitario = 'Estudiante & Tutor';
    } else {
      rolUniversitario = 'Estudiante UPV';
    }

    notifyListeners();
  }

  // Redireccionar al inicio principal de la aplicacion
  Future<void> entrarAConectaUPV(BuildContext context) async {
    _estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 600));

    _estaCargando = false;
    notifyListeners();

    if (!context.mounted) return;

// Cambia la ruta del botón "Entrar a ConectaUPV" a '/swipe'
Navigator.pushNamedAndRemoveUntil(context, '/swipe', (route) => false);  }
}