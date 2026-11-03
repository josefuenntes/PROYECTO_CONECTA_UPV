import 'package:flutter/material.dart';
import 'chats_inicio_logica.dart';
import 'chats_conecta2_logica.dart';

class ChatsConecta2Diseno extends StatefulWidget {
  const ChatsConecta2Diseno({super.key});

  @override
  State<ChatsConecta2Diseno> createState() => _ChatsConecta2DisenoState();
}

class _ChatsConecta2DisenoState extends State<ChatsConecta2Diseno> {
  ChatsConecta2Logica? _logica;

  static const Color colorSuperficie = Color(0xFFF8F9FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF0B1C30);
  static const Color colorTextoSecundario = Color(0xFF5A4138);
  static const Color colorBurbujaRecibida = Color(0xFFF5F3FF);
  static const Color colorBordeRecibido = Color(0xFFEDE9FE);
  static const Color colorVerdeEnLinea = Color(0xFF10B981);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_logica == null) {
      final chatArg = ModalRoute.of(context)?.settings.arguments as ModeloChat?;
      final chatFinal = chatArg ??
          ModeloChat(
            id: 'demo',
            nombre: 'Jose',
            carrera: 'ITI 6° Cuatrimestre',
            imagenUrl:
                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=400',
            estaEnLinea: true,
          );
      _logica = ChatsConecta2Logica(chatUsuario: chatFinal);
    }
  }

  @override
  void dispose() {
    _logica?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_logica == null) return const Scaffold();

    return AnimatedBuilder(
      animation: _logica!,
      builder: (context, _) {
        final chat = _logica!.chatUsuario;

        return Scaffold(
          backgroundColor: colorSuperficie,
          appBar: AppBar(
            backgroundColor: colorSuperficie.withOpacity(0.95),
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: colorTextoPrincipal),
              onPressed: () => _logica!.regresar(context),
            ),
            title: const Text(
              'Chat Individual',
              style: TextStyle(
                color: colorTextoPrincipal,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
actions: [
  IconButton(
    icon: const Icon(Icons.settings, color: colorPrimario),
    onPressed: () {
      Navigator.pushNamed(
        context,
        '/chats_seguridad',
        arguments: _logica!.chatUsuario,
      );
    },
  ),
],          ),
          body: Column(
            children: [
              // Cabecera superior con datos del usuario
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: colorSuperficie,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(chat.imagenUrl),
                        ),
                        if (chat.estaEnLinea)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: colorVerdeEnLinea,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chat.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colorTextoPrincipal,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const CircleAvatar(radius: 3, backgroundColor: colorVerdeEnLinea),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'En línea • ${chat.carrera}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: colorTextoSecundario,
                      ),
                    ),
                  ],
                ),
              ),

              // Lista de mensajes e insignias
              Expanded(
                child: ListView(
                  controller: _logica!.scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5EEFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Conectaron el 24 de Octubre de 2024',
                          style: TextStyle(fontSize: 11, color: colorTextoSecundario),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDAE2FD).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Hicieron match por Programación & Tecnologías',
                          style: TextStyle(fontSize: 11, color: colorTextoSecundario),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF4FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Hoy',
                          style: TextStyle(fontSize: 11, color: colorTextoSecundario),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._logica!.mensajes.map((msg) => _construirBurbujaMensaje(msg, chat)),
                  ],
                ),
              ),

              // Barra inferior de envío
              _construirBarraEntrada(),
            ],
          ),
        );
      },
    );
  }

  Widget _construirBurbujaMensaje(ModeloMensaje mensaje, ModeloChat chat) {
    final esMio = mensaje.esMio;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: esMio ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!esMio) ...[
            CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(chat.imagenUrl),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
crossAxisAlignment: esMio ? CrossAxisAlignment.end : CrossAxisAlignment.start,              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: esMio ? colorPrimario : colorBurbujaRecibida,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomLeft: Radius.circular(esMio ? 18 : 2),
                      bottomRight: Radius.circular(esMio ? 2 : 18),
                    ),
                    border: esMio ? null : Border.all(color: colorBordeRecibido),
                  ),
                  child: Text(
                    mensaje.texto,
                    style: TextStyle(
                      fontSize: 14,
                      color: esMio ? Colors.white : const Color(0xFF1E1B4B),
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      mensaje.hora,
                      style: TextStyle(
                        fontSize: 10,
                        color: colorTextoSecundario.withOpacity(0.8),
                      ),
                    ),
                    if (esMio) ...[
                      const SizedBox(width: 4),
                      const Icon(Icons.done_all, size: 14, color: colorPrimario),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirBarraEntrada() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: colorSuperficie,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -1)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: colorPrimario),
              style: IconButton.styleFrom(
                backgroundColor: colorBurbujaRecibida,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _logica!.controllerMensaje,
                        onSubmitted: (_) => _logica!.enviarMensaje(),
                        style: const TextStyle(color: colorTextoPrincipal, fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: 'Escribe un mensaje...',
                          hintStyle: TextStyle(color: colorTextoSecundario, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.sentiment_satisfied, color: colorTextoSecundario, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _logica!.enviarMensaje,
              child: const CircleAvatar(
                radius: 22,
                backgroundColor: colorPrimario,
                child: Icon(Icons.send, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}