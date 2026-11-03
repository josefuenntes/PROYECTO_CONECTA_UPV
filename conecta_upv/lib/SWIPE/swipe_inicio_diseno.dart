import 'package:flutter/material.dart';
import 'swipe_inicio_logica.dart';

class SwipeDiseno extends StatefulWidget {
  const SwipeDiseno({super.key});

  @override
  State<SwipeDiseno> createState() => _SwipeDisenoState();
}

class _SwipeDisenoState extends State<SwipeDiseno> {
  late final SwipeLogica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorRojoRechazo = Color(0xFFFEE2E2);
  static const Color colorIconoRojo = Color(0xFFDC2626);
  static const Color colorVerdeAcepto = Color(0xFFD1FAE5);
  static const Color colorIconoVerde = Color(0xFF059669);
  static const Color colorFondoChip = Color(0xFFF5F3F3);

  @override
  void initState() {
    super.initState();
    _logica = SwipeLogica();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey('filtroMateria')) {
      final materia = args['filtroMateria'] as String;
      _logica.filtrarPorMateria(materia);
    }
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
          appBar: _construirAppBar(),
          body: SafeArea(
            child: _logica.hayMasPerfiles
                ? AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(scale: animation, child: child),
                      );
                    },
                    child: SingleChildScrollView(
                      key: ValueKey<String>(_logica.perfilActual!.id),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      child: _construirTarjetaPerfil(_logica.perfilActual!),
                    ),
                  )
                : _construirEstadoSinPerfiles(),
          ),
          bottomNavigationBar: _construirNavegacionInferior(),
        );
      },
    );
  }

PreferredSizeWidget _construirAppBar() {
    return AppBar(
      backgroundColor: colorSuperficie.withOpacity(0.9),
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: colorPrimario,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.hub, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          RichText(
            text: const TextSpan(
              text: 'Conecta',
              style: TextStyle(
                color: colorTextoPrincipal,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: 'UPV',
                  style: TextStyle(color: colorPrimario, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: colorPrimario, size: 24), // 👈 Icono de salir morado
          tooltip: 'Cerrar sesión',
          onPressed: () => _logica.cerrarSesion(context),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
  Widget _construirTarjetaPerfil(PerfilEstudiante perfil) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner de Foto con Gradiente y Texto
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  perfil.imagenUrl,
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 260,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.person, size: 80, color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.black87, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            perfil.nombre,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ', ${perfil.edad}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        perfil.carrera,
                        style: const TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Seccion "BUSCO APRENDER"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.school, size: 20, color: colorPrimario),
                    SizedBox(width: 6),
                    Text(
                      'BUSCO APRENDER',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorPrimario,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: perfil.buscoAprender.map((item) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: colorFondoChip,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: colorPrimario.withValues(alpha: 0.15),
                              child: Icon(item.icono, size: 16, color: colorPrimario),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.titulo,
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: colorTextoPrincipal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Seccion "Puedo ensenar"
                const Text(
                  'Puedo enseñar:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: colorTextoPrincipal,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: perfil.puedoEnsenar.map((item) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: colorFondoChip,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.amber.withOpacity(0.2),
                              child: Icon(item.icono, size: 16, color: Colors.amber.shade900),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.titulo,
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: colorTextoPrincipal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // Botones de Accion (X, Info, Check)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: _logica.rechazarPerfil,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 58,
                        height: 58,
                        decoration: const BoxDecoration(
                          color: colorRojoRechazo,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, size: 30, color: colorIconoRojo),
                      ),
                    ),
// Dentro de _construirTarjetaPerfil en lib/SWIPE/swipe_diseno.dart:
InkWell(
  onTap: () {
    Navigator.pushNamed(
      context,
      '/swipe_info',
      arguments: perfil, // 👈 Se pasa el estudiante seleccionado
    );
  },
  borderRadius: BorderRadius.circular(25),
  child: Container(
    width: 46,
    height: 46,
    decoration: const BoxDecoration(
      color: colorPrimario,
      shape: BoxShape.circle,
    ),
    child: const Icon(Icons.info_outline, size: 22, color: Colors.white),
  ),
),                    InkWell(
                      onTap: () => _logica.aceptarPerfil(context),
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 58,
                        height: 58,
                        decoration: const BoxDecoration(
                          color: colorVerdeAcepto,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, size: 30, color: colorIconoVerde),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirEstadoSinPerfiles() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.style_outlined, size: 64, color: colorTextoSecundario),
          const SizedBox(height: 12),
          const Text(
            '¡Has visto todos los perfiles!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
          ),
          const SizedBox(height: 6),
          const Text(
            'Vuelve más tarde para conectar con nuevos compañeros.',
            style: TextStyle(fontSize: 13, color: colorTextoSecundario),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _logica.reiniciarPerfiles,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text('Reiniciar lista', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorPrimario,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirNavegacionInferior() {
    return BottomNavigationBar(
      currentIndex: _logica.tabSeleccionada,
      onTap: (index) => _logica.cambiarTab (context, index), //logica para cambiar de pestaña
      selectedItemColor: colorPrimario,
      unselectedItemColor: colorTextoSecundario,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorSuperficie,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.style),
          label: 'Swipe',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups),
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
    );
  }
}