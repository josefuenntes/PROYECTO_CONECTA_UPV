import 'package:flutter/material.dart';
import 'perfil_inicio_logica.dart';

class PerfilDiseno extends StatefulWidget {
  const PerfilDiseno({super.key});

  @override
  State<PerfilDiseno> createState() => _PerfilDisenoState();
}

class _PerfilDisenoState extends State<PerfilDiseno> {
  late PerfilInicioLogica _logica;

  static const Color colorSuperficie = Color(0xFFF8F9FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF0B1C30);
  static const Color colorTextoSecundario = Color(0xFF565E74);
  static const Color colorContenedorBajo = Color(0xFFEFF4FF);

  @override
  void initState() {
    super.initState();
    _logica = PerfilInicioLogica();
  }

  @override
  void dispose() {
    _logica.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _logica,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: colorSuperficie,
          appBar: AppBar(
            backgroundColor: colorSuperficie.withOpacity(0.9),
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: colorPrimario,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'C',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'ConectaUPV',
                  style: TextStyle(color: colorPrimario, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EEFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.settings, color: colorTextoPrincipal, size: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/perfil_ajustes'); // 👈 AQUÍ SE CONECTÓ LA RUTA
                },
              ),
              const SizedBox(width: 12),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                // Avatar con botón de cámara
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 54,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=400',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: colorPrimario,
                          child: const Icon(Icons.photo_camera, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Nombre y Carrera
                const Text(
                  'Mateo Morales',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ingeniería en Tecnologías de la Información',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorPrimario),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCE9FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.school, size: 14, color: colorPrimario),
                      SizedBox(width: 4),
                      Text('ITI • 6° Cuatrimestre', style: TextStyle(fontSize: 11, color: colorTextoSecundario)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Tarjetas de Estadísticas
                Row(
                  children: [
                    _construirTarjetaEstadistica('18', 'Conexiones'),
                    const SizedBox(width: 8),
                    _construirTarjetaEstadistica('9.4', 'Reputación'),
                    const SizedBox(width: 8),
                    _construirTarjetaEstadistica('14', 'Tutorías dadas'),
                  ],
                ),
                const SizedBox(height: 24),

                // Título de Sección
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ACERCA DE MÍ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: colorTextoSecundario,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 1. Desplegable: Sobre mí
                _construirAcordeon(
                  titulo: 'sobre mi...',
                  subtitulo: 'Intereses, hobbies, biografía personal',
                  icono: Icons.person_pin,
                  estaAbierto: _logica.sobreMiAbierto,
                  onTap: _logica.toggleSobreMi,
                  contenido: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorContenedorBajo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          '"Apasionado por el desarrollo de software móvil, la inteligencia artificial aplicada y el café de especialidad. Cuando no estoy programando, participo en el club de robótica de la UPV o juego ajedrez en los jardines del campus."',
                          style: TextStyle(fontSize: 13, color: colorTextoPrincipal, height: 1.4),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: const [
                          _EtiquetaChip(texto: '☕ Café & Código'),
                          _EtiquetaChip(texto: '♟️ Club Ajedrez UPV'),
                          _EtiquetaChip(texto: '📱 Flutter Lover'),
                          _EtiquetaChip(texto: '🎧 Lo-Fi Beats'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEDE9FE),
                            foregroundColor: colorPrimario,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/perfil_sobremi');
                          },
                          icon: const Icon(Icons.edit, size: 16),
                          label: const Text('Editar biografía', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // 2. Desplegable: Quiero aprender
                _construirAcordeon(
                  titulo: 'quiero aprender o conocer...',
                  subtitulo: 'Temas, materias y habilidades deseadas',
                  icono: Icons.lightbulb_outline,
                  estaAbierto: _logica.aprenderAbierto,
                  onTap: _logica.toggleAprender,
                  contenido: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Materias y tópicos en los que busco compañeros o mentores este cuatrimestre:',
                        style: TextStyle(fontSize: 12, color: colorTextoSecundario),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: const [
                          _EtiquetaHabilidad(icono: Icons.psychology, texto: 'Inteligencia Artificial'),
                          _EtiquetaHabilidad(icono: Icons.functions, texto: 'Cálculo Vectorial'),
                          _EtiquetaHabilidad(icono: Icons.router, texto: 'Redes Cisco CCNA'),
                          _EtiquetaHabilidad(icono: Icons.cloud, texto: 'AWS Cloud'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEDE9FE),
                            foregroundColor: colorPrimario,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/perfil_aprender');
                          },
                          icon: const Icon(Icons.edit, size: 16),
                          label: const Text('Editar objetivos', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // 3. Desplegable: Quiero enseñar
                _construirAcordeon(
                  titulo: 'quiero enseñar o puedo ayudar a...',
                  subtitulo: 'Tutorías, proyectos colaborativos y destrezas',
                  icono: Icons.volunteer_activism,
                  estaAbierto: _logica.ensenarAbierto,
                  onTap: _logica.toggleEnsenar,
                  contenido: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Habilidades disponibles para asesorías entre pares y grupos de estudio:',
                        style: TextStyle(fontSize: 12, color: colorTextoSecundario),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: const [
                          _EtiquetaHabilidad(icono: Icons.code, texto: 'Python & Django'),
                          _EtiquetaHabilidad(icono: Icons.storage, texto: 'Bases de Datos SQL'),
                          _EtiquetaHabilidad(icono: Icons.draw, texto: 'Diseño UX/UI Figma'),
                          _EtiquetaHabilidad(icono: Icons.terminal, texto: 'Linux & Git'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEDE9FE),
                            foregroundColor: colorPrimario,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/perfil_ensenar');
                          },
                          icon: const Icon(Icons.edit, size: 16),
                          label: const Text('Editar habilidades', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Botón Cerrar Sesión
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFDAD6),
                      foregroundColor: const Color(0xFFBA1A1A),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () => _logica.cerrarSesion(context),
                    icon: const Icon(Icons.logout, size: 20),
                    label: const Text('Cerrar Sesión Universitaria', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          bottomNavigationBar: _construirNavegacionInferior(context),
        );
      },
    );
  }

  Widget _construirTarjetaEstadistica(String valor, String titulo) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: colorContenedorBajo,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              valor,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorPrimario),
            ),
            const SizedBox(height: 2),
            Text(
              titulo,
              style: const TextStyle(fontSize: 11, color: colorTextoSecundario),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirAcordeon({
    required String titulo,
    required String subtitulo,
    required IconData icono,
    required bool estaAbierto,
    required VoidCallback onTap,
    required Widget contenido,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE9FE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icono, color: colorPrimario, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(titulo, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorTextoPrincipal)),
                        Text(subtitulo, style: const TextStyle(fontSize: 11, color: colorTextoSecundario)),
                      ],
                    ),
                  ),
                  Icon(estaAbierto ? Icons.expand_less : Icons.expand_more, color: colorTextoSecundario),
                ],
              ),
            ),
          ),
          if (estaAbierto)
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
              child: contenido,
            ),
        ],
      ),
    );
  }

  Widget _construirNavegacionInferior(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: colorSuperficie,
        border: Border(top: BorderSide(color: Color(0xFFE5EEFF))),
      ),
      child: BottomNavigationBar(
        currentIndex: _logica.tabSeleccionada,
        onTap: (index) => _logica.cambiarTab(context, index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorSuperficie,
        selectedItemColor: colorPrimario,
        unselectedItemColor: colorTextoSecundario,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Swipe'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Perfil'),
        ],
      ),
    );
  }
}

class _EtiquetaChip extends StatelessWidget {
  final String texto;
  const _EtiquetaChip({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE9FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 11, color: Color(0xFF0B1C30)),
      ),
    );
  }
}

class _EtiquetaHabilidad extends StatelessWidget {
  final IconData icono;
  final String texto;
  const _EtiquetaHabilidad({required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFC4E7FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 14, color: const Color(0xFF004C69)),
          const SizedBox(width: 4),
          Text(texto, style: const TextStyle(fontSize: 12, color: Color(0xFF004C69), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}