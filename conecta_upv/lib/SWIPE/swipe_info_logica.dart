import 'package:flutter/material.dart';

class SwipeInfoLogica extends ChangeNotifier {
  Map<String, dynamic>? datosEstudiante;
  bool estaBloqueado = false;
  bool estaCargando = false;

  void cargarDatosDesdeArgumentos(Object? argumentos) {
    if (argumentos != null && argumentos is Map<String, dynamic>) {
      datosEstudiante = argumentos;
      notifyListeners();
    }
  }

// Regresa a la tarjeta de Swipe previa o redirige si se entró por URL directa
  void regresar(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // Cierra el detalle y regresa a Swipe Inicio
    } else {
      Navigator.pushReplacementNamed(context, '/swipe'); // Respaldo a Swipe Inicio
    }
  }  // Ejecuta el bloqueo y retorna a la pantalla de Swipe



  Future<void> procesarBloqueoUsuario(BuildContext context, String nombre) async {
    estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 600));

    estaCargando = false;
    estaBloqueado = true;
    notifyListeners();

    if (!context.mounted) return;

    // Cierra la pantalla de detalle y regresa a Swipe informando el bloqueo
    Navigator.pop(context, {'bloqueado': true, 'nombre': nombre});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$nombre ha sido bloqueado(a) correctamente'),
        backgroundColor: const Color(0xFFB91C1C),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void reportarPerfil(BuildContext context, String nombre) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reporte enviado para el perfil de $nombre'),
        backgroundColor: const Color(0xFF059669),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}