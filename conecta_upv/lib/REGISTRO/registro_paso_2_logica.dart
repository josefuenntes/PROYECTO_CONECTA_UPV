import 'package:flutter/material.dart';

class RegistroPaso2Logica extends ChangeNotifier {
  // Controladores y datos del formulario
  final TextEditingController matriculaController = TextEditingController(text: '2024UPV0142');
  
  bool _matriculaVerificada = true;
  int _edadSeleccionada = 20;
  String _cuatrimestreSeleccionado = 'ESTADIA';
  String _carreraSeleccionada = 'Ingenieria en Tecnologias de la Informacion e Innovacion Digital';
  bool _estaCargando = false;

  // Catalogos de opciones
  final List<int> listaEdades = List.generate(15, (index) => 17 + index); // 17 a 31 anos
  final List<String> listaCuatrimestres = ['1', '2', '3', '4', '5', 'ESTADIA', '7', '8', '9'];
  final List<String> listaCarreras = [
    'Ingenieria en Tecnologias de la Informacion e Innovacion Digital',
    'Ingenieria Mecatronica',
    'Ingenieria Industrial',
    'Licenciatura en Administracion y Gestion Empresarial',
    'Ingenieria en Sistemas Automotrices',
  ];

  // Getters
  bool get matriculaVerificada => _matriculaVerificada;
  int get edadSeleccionada => _edadSeleccionada;
  String get cuatrimestreSeleccionado => _cuatrimestreSeleccionado;
  String get carreraSeleccionada => _carreraSeleccionada;
  bool get estaCargando => _estaCargando;

  // Setters y metodos de actualizacion
  void seleccionarEdad(int? nuevaEdad) {
    if (nuevaEdad != null) {
      _edadSeleccionada = nuevaEdad;
      notifyListeners();
    }
  }

  void seleccionarCuatrimestre(String cuatrimestre) {
    _cuatrimestreSeleccionado = cuatrimestre;
    notifyListeners();
  }

  void seleccionarCarrera(String? nuevaCarrera) {
    if (nuevaCarrera != null) {
      _carreraSeleccionada = nuevaCarrera;
      notifyListeners();
    }
  }

  void cambiarFotoPerfil(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Seleccionar o tomar foto de perfil...'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Navegacion
// Navegacion
// Navegacion y acumulacion de datos
  Future<void> procesarSiguiente(BuildContext context, Map<String, dynamic>? datosPaso1) async {
    if (matriculaController.text.trim().isEmpty) {
      _mostrarMensaje(context, 'Por favor ingresa una matricula valida', esError: true);
      return;
    }

    _estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1000));

    _estaCargando = false;
    notifyListeners();

    if (!context.mounted) return;

    // 📦 Fusionar datos acumulados del Paso 1 + Paso 2
    final Map<String, dynamic> datosAcumulados = {
      ...?datosPaso1,
      'matricula': matriculaController.text.trim(),
      'edad': _edadSeleccionada,
      'cuatrimestre': '${_cuatrimestreSeleccionado}to Cuatrimestre',
      'carrera': _carreraSeleccionada,
    };

    // 🚀 Enviar mapa al Paso 3
    Navigator.pushNamed(context, '/registro_paso_3', arguments: datosAcumulados);
  }
  void regresar(BuildContext context) {
    Navigator.maybePop(context);
  }

  void _mostrarMensaje(BuildContext context, String mensaje, {bool esError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: esError ? const Color(0xFFBA1A1A) : const Color(0xFF10B981),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    matriculaController.dispose();
    super.dispose();
  }
}