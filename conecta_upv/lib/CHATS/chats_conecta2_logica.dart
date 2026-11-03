import 'package:flutter/material.dart';
import 'chats_inicio_logica.dart';

/// Modelo de datos para cada mensaje individual
class ModeloMensaje {
  final String id;
  final String texto;
  final String hora;
  final bool esMio;
  final bool leido;

  ModeloMensaje({
    required this.id,
    required this.texto,
    required this.hora,
    required this.esMio,
    this.leido = true,
  });
}

class ChatsConecta2Logica extends ChangeNotifier {
  final ModeloChat chatUsuario;
  final TextEditingController controllerMensaje = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<ModeloMensaje> mensajes = [];

  ChatsConecta2Logica({required this.chatUsuario}) {
    _cargarMensajesIniciales();
  }

  void _cargarMensajesIniciales() {
    mensajes = [
      ModeloMensaje(
        id: 'msg_1',
        texto: '¡Hola! Vi que también estás en ITI y te interesa armar proyectos.',
        hora: '10:02 AM',
        esMio: false,
      ),
      ModeloMensaje(
        id: 'msg_2',
        texto: '¡Hola ${chatUsuario.nombre}! Sí, justo ando buscando equipo para la materia de redes y programación.',
        hora: '10:08 AM',
        esMio: true,
      ),
      ModeloMensaje(
        id: 'msg_3',
        texto: 'puedo reunirme a las 10 am',
        hora: '10:14 AM',
        esMio: true,
      ),
      ModeloMensaje(
        id: 'msg_4',
        texto: '¡Excelente! En la cafetería o en biblioteca central? Ya tengo mi laptop lista.',
        hora: '10:15 AM',
        esMio: false,
      ),
    ];
  }

  // 🔹 Enviar un nuevo mensaje y hacer autoscroll hacia abajo
  void enviarMensaje() {
    final texto = controllerMensaje.text.trim();
    if (texto.isEmpty) return;

    final ahora = DateTime.now();
    final horaStr = '${ahora.hour.toString().padLeft(2, '0')}:${ahora.minute.toString().padLeft(2, '0')}';

    mensajes.add(
      ModeloMensaje(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        texto: texto,
        hora: horaStr,
        esMio: true,
      ),
    );

    controllerMensaje.clear();
    notifyListeners();
    _hacerScrollAlFinal();
  }

  void _hacerScrollAlFinal() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void regresar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllerMensaje.dispose();
    scrollController.dispose();
    super.dispose();
  }
}