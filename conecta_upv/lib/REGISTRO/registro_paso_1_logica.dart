import 'package:flutter/material.dart';

class RegistroPaso1Logica extends ChangeNotifier {
  // Controladores de texto vacíos desde inicio
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoPaternoController = TextEditingController();
  final TextEditingController apellidoMaternoController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Estados de la vista
  bool _ocultarPassword = true;
  bool _ocultarConfirmPassword = true;
  bool _estaCargando = false;

  // Selección de datos académicos en blanco (null por defecto)
  int? _edadSeleccionada;
  String? _cuatrimestreSeleccionado;
  String? _carreraSeleccionada;

  // Catálogos de opciones actualizados
  final List<int> listaEdades = List.generate(15, (index) => 17 + index); // 17 a 31 años
  final List<String> listaCuatrimestres = ['1', '2', '3', '4', '5', 'ESTADIA 1', '7', '8', '9', 'ESTADIA 2'];
  final List<String> listaCarreras = [
    'Ingenieria en Tecnologias de la Informacion e Innovacion Digital',
    'Ingenieria Mecatronica',
    'Ingenieria Industrial',
    'Licenciatura en Administracion y Gestion Empresarial',
    'Ingenieria en Sistemas Automotrices',
  ];

  // Getters
  bool get ocultarPassword => _ocultarPassword;
  bool get ocultarConfirmPassword => _ocultarConfirmPassword;
  bool get estaCargando => _estaCargando;
  int? get edadSeleccionada => _edadSeleccionada;
  String? get cuatrimestreSeleccionado => _cuatrimestreSeleccionado;
  String? get carreraSeleccionada => _carreraSeleccionada;

  // Acciones de actualización
  void alternarVisibilidadPassword() {
    _ocultarPassword = !_ocultarPassword;
    notifyListeners();
  }

  void alternarVisibilidadConfirmPassword() {
    _ocultarConfirmPassword = !_ocultarConfirmPassword;
    notifyListeners();
  }

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

  // Proceso de validación y navegación
  Future<void> procesarRegistro(BuildContext context) async {
    final nombre = nombreController.text.trim();
    final apellidoPaterno = apellidoPaternoController.text.trim();
    final apellidoMaterno = apellidoMaternoController.text.trim();
    final matricula = matriculaController.text.trim();
    final correo = correoController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (nombre.isEmpty ||
        apellidoPaterno.isEmpty ||
        apellidoMaterno.isEmpty ||
        matricula.isEmpty ||
        _edadSeleccionada == null ||
        _cuatrimestreSeleccionado == null ||
        _carreraSeleccionada == null ||
        correo.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _mostrarMensaje(context, 'Por favor completa todos los campos obligatorios (*)', esError: true);
      return;
    }

    // 🔒 Restricción de Matrícula: Exactamente 7 dígitos
    final RegExp reglaMatricula = RegExp(r'^\d{7}$');
    if (!reglaMatricula.hasMatch(matricula)) {
      _mostrarMensaje(context, 'La matrícula debe ser de exactamente 7 dígitos numéricos', esError: true);
      return;
    }

    if (!correo.endsWith('@upv.edu.mx')) {
      _mostrarMensaje(context, 'El correo debe ser institucional (@upv.edu.mx)', esError: true);
      return;
    }

    if (password != confirmPassword) {
      _mostrarMensaje(context, 'Las contraseñas no coinciden', esError: true);
      return;
    }

    _estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1000));

    _estaCargando = false;
    notifyListeners();

    if (!context.mounted) return;

    // 📦 Empaquetar todos los datos unificados
    final Map<String, dynamic> datosUnificados = {
      'nombre': nombre,
      'apellidoPaterno': apellidoPaterno,
      'apellidoMaterno': apellidoMaterno,
      'apellidos': '$apellidoPaterno $apellidoMaterno',
      'matricula': matricula,
      'edad': _edadSeleccionada,
      'cuatrimestre': _cuatrimestreSeleccionado,
      'carrera': _carreraSeleccionada,
      'correo': correo,
    };

    // 🚀 Navegar al siguiente paso
    Navigator.pushNamed(context, '/registro_paso_3', arguments: datosUnificados);
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
    apellidoPaternoController.dispose();
    apellidoMaternoController.dispose();
    matriculaController.dispose();
    correoController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}