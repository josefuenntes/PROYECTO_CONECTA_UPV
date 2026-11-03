import 'package:flutter/material.dart';
import 'chats_inicio_logica.dart';

class ChatsSeguridadLogica extends ChangeNotifier {
  final ModeloChat chatUsuario;

  ChatsSeguridadLogica({required this.chatUsuario});

  // 🔹 Regresar a la pantalla anterior
  void regresar(BuildContext context) {
    Navigator.pop(context);
  }

  // 🔹 Deshacer el match con el usuario
  void deshacerMatch(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('¿Deshacer match con ${chatUsuario.nombre}?'),
        content: const Text(
          'Esta conexión se eliminará y el chat desaparecerá de tu lista. Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFBA1A1A),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx); // Cierra modal
              Navigator.pushNamedAndRemoveUntil(context, '/chats', (route) => false);
            },
            child: const Text('Deshacer Match'),
          ),
        ],
      ),
    );
  }

  // 🔹 Bloquear usuario
  void bloquearUsuario(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('¿Bloquear a ${chatUsuario.nombre}?'),
        content: Text(
          '${chatUsuario.nombre} no podrá enviarte mensajes, ver tu perfil ni interactuar contigo en ConectaUPV.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF565E74),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushNamedAndRemoveUntil(context, '/chats', (route) => false);
            },
            child: const Text('Bloquear'),
          ),
        ],
      ),
    );
  }

  // 🔹 Enviar denuncia / reporte anónimo
  void reportarUsuario(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reporte enviado anónimamente sobre ${chatUsuario.nombre}.'),
        backgroundColor: const Color(0xFF7C3AED),
      ),
    );
  }

  // 🔹 Activar protocolo prioritario de acoso
  void activarReporteAcoso(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(' Protocolo Prioritario de Acoso'),
        content: const Text(
          '¿Deseas activar el protocolo de atención inmediata y enlace directo con el Centro de Apoyo Universitario? Tu solicitud será atendida de manera confidencial y prioritaria.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFBA1A1A),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(' Protocolo de seguridad iniciado. Un asesor de la UPV se pondrá en contacto.'),
                  duration: Duration(seconds: 4),
                  backgroundColor: Color(0xFFBA1A1A),
                ),
              );
            },
            child: const Text('Activar Reporte'),
          ),
        ],
      ),
    );
  }
}