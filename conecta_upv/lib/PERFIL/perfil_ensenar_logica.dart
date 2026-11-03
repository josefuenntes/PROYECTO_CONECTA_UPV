import 'package:flutter/material.dart';

class PerfilEnsenarLogica extends ChangeNotifier {
  final TextEditingController controllerFortalezas = TextEditingController();
  final int maxCaracteres = 1000;
  int caracteresActuales = 0;

  PerfilEnsenarLogica({String textoInicial = ''}) {
    controllerFortalezas.text = textoInicial.isNotEmpty
        ? textoInicial
        : 'Tengo experiencia en programación orientada a objetos, bases de datos SQL y desarrollo móvil con Flutter. Puedo ayudar con asesorías previas a parciales, revisión de código o proyectos integradores.';
    
    caracteresActuales = controllerFortalezas.text.length;
    controllerFortalezas.addListener(_actualizarContador);
  }

  void _actualizarContador() {
    caracteresActuales = controllerFortalezas.text.length;
    notifyListeners();
  }

  // 🔹 Agregar etiqueta desde las sugerencias rápidas
  void agregarTag(String tag) {
    final actual = controllerFortalezas.text.trim();
    if (actual.isEmpty) {
      controllerFortalezas.text = 'Puedo ayudar con: $tag';
    } else if (!actual.contains(tag)) {
      controllerFortalezas.text = '$actual, $tag';
    }
    controllerFortalezas.selection = TextSelection.fromPosition(
      TextPosition(offset: controllerFortalezas.text.length),
    );
    notifyListeners();
  }

  // 🔹 Limpiar campo de texto
  void limpiarTexto() {
    controllerFortalezas.clear();
    notifyListeners();
  }

  // 🔹 Guardar cambios y regresar
  void guardarCambios(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Habilidades y fortalezas guardadas correctamente!'),
        backgroundColor: Color(0xFF7C3AED),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pop(context, controllerFortalezas.text);
  }

  void regresar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllerFortalezas.removeListener(_actualizarContador);
    controllerFortalezas.dispose();
    super.dispose();
  }
}