import 'package:flutter/material.dart';
import 'chats_inicio_logica.dart';
import 'chats_seguridad_logica.dart';

class ChatsSeguridadDiseno extends StatefulWidget {
  const ChatsSeguridadDiseno({super.key});

  @override
  State<ChatsSeguridadDiseno> createState() => _ChatsSeguridadDisenoState();
}

class _ChatsSeguridadDisenoState extends State<ChatsSeguridadDiseno> {
  ChatsSeguridadLogica? _logica;

  static const Color colorSuperficie = Color(0xFFF8F9FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF0B1C30);
  static const Color colorTextoSecundario = Color(0xFF565E74);
  static const Color colorRojoRiesgo = Color(0xFFBA1A1A);
  static const Color colorFondoRiesgo = Color(0xFFFFDAD6);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_logica == null) {
      final chatArg = ModalRoute.of(context)?.settings.arguments as ModeloChat?;
      final chatFinal = chatArg ??
          ModeloChat(
            id: 'demo',
            nombre: 'Jose',
            carrera: 'ITI',
            imagenUrl: '',
          );
      _logica = ChatsSeguridadLogica(chatUsuario: chatFinal);
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
            backgroundColor: colorSuperficie.withOpacity(0.9),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: colorTextoPrincipal, size: 20),
              onPressed: () => _logica!.regresar(context),
            ),
            title: const Text(
              'Seguridad',
              style: TextStyle(color: colorTextoPrincipal, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: colorPrimario,
                  child: Icon(Icons.person, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título con indicador lateral
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 24,
                        decoration: BoxDecoration(
                          color: colorPrimario,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'SEGURIDAD',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: colorTextoPrincipal,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Opciones de protección y reporte para este chat. Tu integridad en la comunidad universitaria es nuestra máxima prioridad.',
                    style: TextStyle(color: colorTextoSecundario, fontSize: 13, height: 1.4),
                  ),
                  const SizedBox(height: 16),

                  // Banner confidencial
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colorFondoRiesgo,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: colorRojoRiesgo,
                          child: Icon(Icons.shield, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Protección confidencial y silenciosa',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF93000A),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Si te sientes en riesgo o con incomodidad, toma acción inmediata. Ninguna de estas medidas notificará o alertará a ${chat.nombre}.',
                                style: const TextStyle(color: Color(0xFF93000A), fontSize: 12, height: 1.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Opcion 1: Cancelar Match
                  _construirTarjetaOpcion(
                    icono: Icons.cancel,
                    colorIcono: colorRojoRiesgo,
                    titulo: 'Cancelar Match',
                    descripcion: 'Eliminarás esta conexión. El chat desaparecerá y ya no aparecerán en sus listas mutuas de matches.',
                    textoBoton: 'Deshacer match',
                    iconoBoton: Icons.person_remove,
                    onTapBoton: () => _logica!.deshacerMatch(context),
                  ),
                  const SizedBox(height: 14),

                  // Opcion 2: Bloquear
                  _construirTarjetaOpcion(
                    icono: Icons.block,
                    colorIcono: colorTextoSecundario,
                    titulo: 'Bloquear',
                    descripcion: '${chat.nombre} no podrá enviarte mensajes, ver tu perfil ni interactuar contigo en ConectaUPV.',
                    textoBoton: 'Bloquear',
                    iconoBoton: Icons.do_not_disturb_on,
                    colorBoton: colorTextoSecundario,
                    colorTextoBoton: Colors.white,
                    onTapBoton: () => _logica!.bloquearUsuario(context),
                  ),
                  const SizedBox(height: 14),

                  // Opcion 3: Denunciar
                  _construirTarjetaOpcion(
                    icono: Icons.flag,
                    colorIcono: colorPrimario,
                    titulo: 'Denunciar',
                    descripcion: 'Envía un reporte anónimo para revisión de conducta inapropiada o faltas al reglamento escolar.',
                    textoBoton: 'Reportar',
                    iconoBoton: Icons.report,
                    colorBoton: const Color(0xFFF3EEFF),
                    colorTextoBoton: const Color(0xFF630ED4),
                    onTapBoton: () => _logica!.reportarUsuario(context),
                  ),
                  const SizedBox(height: 14),

                  // Opcion 4: Acoso (Tarjeta roja destacada)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorRojoRiesgo,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.warning, color: colorRojoRiesgo, size: 24),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Acoso',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'PRIORIDAD ALTA',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: colorRojoRiesgo,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Canal prioritario de cero tolerancia. Activa el protocolo de atención inmediata contra el acoso escolar o digital con enlace directo al Centro de Apoyo Universitario.',
                                style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.3),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: colorRojoRiesgo,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  onPressed: () => _logica!.activarReporteAcoso(context),
                                  icon: const Icon(Icons.warning_amber, size: 20),
                                  label: const Text('Activar reporte de acoso', style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tarjeta Línea Directa UPV
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5EEFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: colorPrimario,
                              child: Icon(Icons.phone_in_talk, color: Colors.white, size: 16),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Línea Directa de Seguridad UPV',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: colorTextoPrincipal),
                                ),
                                Text('Atención en campus', style: TextStyle(fontSize: 11, color: colorTextoSecundario)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorPrimario,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.call, size: 16),
                              label: const Text('Llamar ahora', style: TextStyle(fontSize: 12)),
                            ),
                            const Text(
                              'Campus Central UPV',
                              style: TextStyle(fontSize: 11, color: colorTextoSecundario, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Botón Regresar al chat
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEDE9FE),
                        foregroundColor: const Color(0xFF630ED4),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: const BorderSide(color: Color(0xFFDDD6FE)),
                        ),
                      ),
                      onPressed: () => _logica!.regresar(context),
                      icon: const Icon(Icons.arrow_back, size: 18),
                      label: const Text('Regresar al chat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _construirTarjetaOpcion({
    required IconData icono,
    required Color colorIcono,
    required String titulo,
    required String descripcion,
    required String textoBoton,
    required IconData iconoBoton,
    required VoidCallback onTapBoton,
    Color colorBoton = const Color(0xFFE5EEFF),
    Color colorTextoBoton = colorTextoPrincipal,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: colorIcono,
            child: Icon(icono, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                ),
                const SizedBox(height: 4),
                Text(
                  descripcion,
                  style: const TextStyle(fontSize: 12, color: colorTextoSecundario, height: 1.3),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorBoton,
                      foregroundColor: colorTextoBoton,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: onTapBoton,
                    icon: Icon(iconoBoton, size: 18),
                    label: Text(textoBoton, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}