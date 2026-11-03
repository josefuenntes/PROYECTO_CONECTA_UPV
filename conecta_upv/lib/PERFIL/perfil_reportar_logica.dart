import 'package:flutter/material.dart';

class CategoriaIncidencia {
  final String id;
  final String titulo;
  final IconData icono;

  CategoriaIncidencia({
    required this.id,
    required this.titulo,
    required this.icono,
  });
}

class PerfilReportarLogica extends ChangeNotifier {
  final TextEditingController controllerAsunto = TextEditingController();
  final TextEditingController controllerDescripcion = TextEditingController();
  final int maxCaracteres = 1000;
  int caracteresActuales = 0;
  bool estaEnviando = false;
  String? nombreArchivoAdjunto;

  final String correoRespuesta = 'mateo.morales@upv.edu.mx';

final List<CategoriaIncidencia> categorias = [
    CategoriaIncidencia(id: 'bug', titulo: 'Falla técnica o bug de la app', icono: Icons.bug_report),
    CategoriaIncidencia(id: 'conducta', titulo: 'Problema con un usuario o conducta', icono: Icons.security), // 👈 Reemplazado aquí
    CategoriaIncidencia(id: 'cuenta', titulo: 'Error en mi cuenta o datos UPV', icono: Icons.badge),
    CategoriaIncidencia(id: 'notifs', titulo: 'Problema con chats o notificaciones', icono: Icons.mark_chat_unread),
    CategoriaIncidencia(id: 'mejora', titulo: 'Sugerencia de mejora / Otro', icono: Icons.lightbulb_outline),
  ];
  late String categoriaSeleccionadaId;

  PerfilReportarLogica() {
    categoriaSeleccionadaId = categorias.first.id;
    controllerDescripcion.addListener(_actualizarContador);
  }

  void _actualizarContador() {
    caracteresActuales = controllerDescripcion.text.length;
    notifyListeners();
  }

  void seleccionarCategoria(String id) {
    categoriaSeleccionadaId = id;
    notifyListeners();
  }

  void simularAdjuntarFoto() {
    nombreArchivoAdjunto = 'captura_error_upv.png';
    notifyListeners();
  }

  void eliminarAdjunto() {
    nombreArchivoAdjunto = null;
    notifyListeners();
  }

  Future<void> enviarReporte(BuildContext context) async {
    final asunto = controllerAsunto.text.trim();
    final descripcion = controllerDescripcion.text.trim();

    if (asunto.isEmpty || descripcion.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor completa el asunto y la descripción del reporte.'),
          backgroundColor: Color(0xFFBA1A1A),
        ),
      );
      return;
    }

    estaEnviando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 900));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Reporte enviado con éxito! El equipo de soporte te responderá a la brevedad.'),
          backgroundColor: Color(0xFF059669),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }

  void regresar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllerDescripcion.removeListener(_actualizarContador);
    controllerAsunto.dispose();
    controllerDescripcion.dispose();
    super.dispose();
  }
}