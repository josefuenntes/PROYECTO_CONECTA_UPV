import 'package:flutter/material.dart';

class ResumenLogica extends ChangeNotifier {
  // Datos del perfil recopilados de los pasos anteriores
  String nombre = 'Usuario';
  String apellidos = 'Estudiante';
  String correo = 'usuario@upv.edu.mx';
  String matricula = '2024UPV0000';
  int edad = 19;
  String cuatrimestre = '4to Cuatrimestre';
  String carrera = 'Ingenieria en Tecnologias de la Informacion e Innovacion Digital';
  List<String> puedoEnsenar = [];
  List<String> deseoAprender = [];

  bool _estaCargando = false;

  bool get estaCargando => _estaCargando;

  // Cargar datos recibidos desde los argumentos de navegacion
  void cargarDatos(Map<String, dynamic>? datos) {
    if (datos == null) return;

    nombre = datos['nombre'] ?? nombre;
    apellidos = datos['apellidos'] ?? apellidos;
    correo = datos['correo'] ?? correo;
    matricula = datos['matricula'] ?? matricula;
    edad = datos['edad'] ?? edad;
    cuatrimestre = datos['cuatrimestre'] ?? cuatrimestre;
    carrera = datos['carrera'] ?? carrera;
    
    if (datos['puedoEnsenar'] is List<String>) {
      puedoEnsenar = List<String>.from(datos['puedoEnsenar']);
    } else if (datos['puedoEnsenar'] is Set<String>) {
      puedoEnsenar = (datos['puedoEnsenar'] as Set<String>).toList();
    }

    if (datos['deseoAprender'] is List<String>) {
      deseoAprender = List<String>.from(datos['deseoAprender']);
    } else if (datos['deseoAprender'] is Set<String>) {
      deseoAprender = (datos['deseoAprender'] as Set<String>).toList();
    }

    notifyListeners();
  }

  // Finalizar registro completo
Future<void> procesarFinalizarRegistro(BuildContext context) async {
    _estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1000));

    _estaCargando = false;
    notifyListeners();

    if (!context.mounted) return;

    // 📦 Armar el paquete completo de datos cargados
    final Map<String, dynamic> datosFinales = {
      'nombre': nombre,
      'apellidos': apellidos,
      'correo': correo,
      'matricula': matricula,
      'edad': edad,
      'cuatrimestre': cuatrimestre,
      'carrera': carrera,
      'puedoEnsenar': puedoEnsenar,
      'deseoAprender': deseoAprender,
    };

    // 🚀 Navegar a la pantalla de Bienvenida Activada
    Navigator.pushNamed(context, '/bienvenida', arguments: datosFinales);
  }
  void regresarAHabilidades(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void editarPerfil(BuildContext context) {
    // Regresa al primer paso de registro
    Navigator.popUntil(context, ModalRoute.withName('/registro'));
  }
}