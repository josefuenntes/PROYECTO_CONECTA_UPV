import 'package:flutter/material.dart';

class RegistroPaso1Logica extends ChangeNotifier {
  // Controladores de texto para capturar las entradas del formulario
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Estados de la vista
  bool _guardarAliasEnPerfil = true;
  bool _ocultarPassword = true;
  bool _ocultarConfirmPassword = true;
  bool _estaCargando = false;

  // Getters para consultar los estados
  bool get guardarAliasEnPerfil => _guardarAliasEnPerfil;
  bool get ocultarPassword => _ocultarPassword;
  bool get ocultarConfirmPassword => _ocultarConfirmPassword;
  bool get estaCargando => _estaCargando;

  // Acciones de actualización de estado
  void alternarGuardarAlias(bool? valor) {
    if (valor != null) {
      _guardarAliasEnPerfil = valor;
      notifyListeners();
    }
  }

  void alternarVisibilidadPassword() {
    _ocultarPassword = !_ocultarPassword;
    notifyListeners();
  }

  void alternarVisibilidadConfirmPassword() {
    _ocultarConfirmPassword = !_ocultarConfirmPassword;
    notifyListeners();
  }

  // Proceso de validación y simulación de registro
  // Proceso de validación y navegación al Paso 2
// Proceso de validacion y navegacion al Paso 2
  Future<void> procesarRegistro(BuildContext context) async {
    final nombre = nombreController.text.trim();
    final apellidos = apellidosController.text.trim();
    final correo = correoController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (nombre.isEmpty || apellidos.isEmpty || correo.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _mostrarMensaje(context, 'Por favor completa todos los campos obligatorios (*)', esError: true);
      return;
    }

    if (!correo.endsWith('@upv.edu.mx')) {
      _mostrarMensaje(context, 'El correo debe ser institucional (@upv.edu.mx)', esError: true);
      return;
    }

    if (password != confirmPassword) {
      _mostrarMensaje(context, 'Las contrasenas no coinciden', esError: true);
      return;
    }

    _estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1000));

    _estaCargando = false;
    notifyListeners();

    if (!context.mounted) return;

    // 📦 Empaquetar datos del Paso 1
    final Map<String, dynamic> datosPaso1 = {
      'nombre': nombre,
      'apellidos': apellidos,
      'correo': correo,
    };

    // 🚀 Pasar datos como argumentos al Paso 2
    Navigator.pushNamed(context, '/registro_paso_2', arguments: datosPaso1);
  }
  void irAIniciarSesion(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void regresar(BuildContext context) {
    Navigator.maybePop(context);
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
    nombreController.dispose();
    apellidosController.dispose();
    aliasController.dispose();
    correoController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}