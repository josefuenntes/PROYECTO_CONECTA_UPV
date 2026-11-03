import 'package:flutter/material.dart';

class PerfilSobreMiLogica extends ChangeNotifier {
  final TextEditingController controllerBio = TextEditingController();
  final int maxCaracteres = 1000;
  int caracteresActuales = 0;

  PerfilSobreMiLogica({String biografiaInicial = ''}) {
    controllerBio.text = biografiaInicial.isNotEmpty
        ? biografiaInicial
        : 'Apasionado por el desarrollo de software móvil, la inteligencia artificial aplicada y el café de especialidad. Cuando no estoy programando, participo en el club de robótica de la UPV o juego ajedrez en los jardines del campus.';
    
    caracteresActuales = controllerBio.text.length;
    controllerBio.addListener(_actualizarContador);
  }

  void _actualizarContador() {
    caracteresActuales = controllerBio.text.length;
    notifyListeners();
  }

  // 🔹 Agregar texto desde los chips de sugerencia
  void agregarSugerencia(String texto) {
    if (controllerBio.text.trim().isNotEmpty) {
      controllerBio.text = '${controllerBio.text.trim()} $texto';
    } else {
      controllerBio.text = texto;
    }
    controllerBio.selection = TextSelection.fromPosition(
      TextPosition(offset: controllerBio.text.length),
    );
    notifyListeners();
  }

  // 🔹 Limpiar la biografía
  void limpiarBio() {
    controllerBio.clear();
    notifyListeners();
  }

  // 🔹 Guardar cambios y volver
  void guardarCambios(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Biografía actualizada correctamente!'),
        backgroundColor: Color(0xFF7C3AED),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pop(context, controllerBio.text);
  }

  void regresar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllerBio.removeListener(_actualizarContador);
    controllerBio.dispose();
    super.dispose();
  }
}