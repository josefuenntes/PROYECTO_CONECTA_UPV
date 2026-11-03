import 'package:flutter/material.dart';

class PerfilAprenderLogica extends ChangeNotifier {
  final TextEditingController controllerObjetivos = TextEditingController();
  final int maxCaracteres = 1000;
  int caracteresActuales = 0;

  PerfilAprenderLogica({String textoInicial = ''}) {
    controllerObjetivos.text = textoInicial.isNotEmpty
        ? textoInicial
        : 'Busco reforzar conocimientos en estructuras de datos avanzadas, preparación para exámenes de cálculo integral y buenas prácticas en desarrollo backend con Node.js o Go. Me gustaría encontrar compañeros para resolver dudas y proyectos.';
    
    caracteresActuales = controllerObjetivos.text.length;
    controllerObjetivos.addListener(_actualizarContador);
  }

  void _actualizarContador() {
    caracteresActuales = controllerObjetivos.text.length;
    notifyListeners();
  }

  // 🔹 Agregar etiqueta desde las sugerencias rápidas
  void agregarTag(String tag) {
    final actual = controllerObjetivos.text.trim();
    if (actual.isEmpty) {
      controllerObjetivos.text = tag;
    } else {
      controllerObjetivos.text = '$actual, $tag';
    }
    controllerObjetivos.selection = TextSelection.fromPosition(
      TextPosition(offset: controllerObjetivos.text.length),
    );
    notifyListeners();
  }

  // 🔹 Limpiar campo de texto
  void limpiarTexto() {
    controllerObjetivos.clear();
    notifyListeners();
  }

  // 🔹 Guardar cambios y regresar
  void guardarCambios(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Objetivos de aprendizaje guardados correctamente!'),
        backgroundColor: Color(0xFF7C3AED),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pop(context, controllerObjetivos.text);
  }

  void regresar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllerObjetivos.removeListener(_actualizarContador);
    controllerObjetivos.dispose();
    super.dispose();
  }
}