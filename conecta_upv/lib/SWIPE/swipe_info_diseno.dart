import 'package:flutter/material.dart';
import 'swipe_info_logica.dart';

class SwipeInfoDiseno extends StatefulWidget {
  const SwipeInfoDiseno({super.key});

  @override
  State<SwipeInfoDiseno> createState() => _SwipeInfoDisenoState();
}

class _SwipeInfoDisenoState extends State<SwipeInfoDiseno> {
  late final SwipeInfoLogica _logica;
  bool _datosCargados = false;

  // Paleta de colores oficial ConectaUPV
  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorPrimarioClaro = Color(0xFFEDE9FE);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorTextoAtenuado = Color(0xFF9CA3AF);
  static const Color colorEsmeraldaOscuro = Color(0xFF059669);

  // Colores especificos del Modal de Bloqueo
  static const Color colorRojoBoton = Color(0xFFB91C1C);
  static const Color colorRojoFondoIcono = Color(0xFFFDE8E8);
  static const Color colorAzulBotonCancelar = Color(0xFFEAF2FD);
  static const Color colorTextoBotonCancelar = Color(0xFF2C3E50);
  static const Color colorTituloModal = Color(0xFF091E42);
  static const Color colorDescripcionModal = Color(0xFF42526E);

  @override
  void initState() {
    super.initState();
    _logica = SwipeInfoLogica();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_datosCargados) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null) {
        if (args is Map<String, dynamic>) {
          _logica.cargarDatosDesdeArgumentos(args);
        } else {
          _logica.cargarDatosDesdeArgumentos({
            'nombre': (args as dynamic).nombre ?? 'Estudiante',
            'edad': (args as dynamic).edad ?? 20,
            'carrera': (args as dynamic).carrera ?? 'Ingeniería en TI',
            'cuatrimestre': '6° Cuatrimestre',
            'imagenUrl': (args as dynamic).imagenUrl ?? '',
            'fraseInteres': '"Me interesaría encontrar a alguien con quien poder hacer extreme programming o alguien que enseñe sobre integrales y cálculo avanzado."',
            'tagsInteres': ['Pair Programming', 'Cálculo Multivariable', 'Estudio Colaborativo'],
            'buscaAprender': ['Cálculo avanzado', 'Física aplicada', 'Ecuaciones dif.'],
            'puedeEnsenar': ['Programación (Python/C)', 'Redes y Bases de datos', 'Estrategia de Ajedrez'],
            'hobbies': [
              {'titulo': 'Ajedrez', 'icono': Icons.pest_control},
              {'titulo': 'Desarrollo de videojuegos', 'icono': Icons.sports_esports},
              {'titulo': 'Senderismo', 'icono': Icons.hiking},
              {'titulo': 'Lectura de ciencia ficción', 'icono': Icons.auto_stories},
              {'titulo': 'Fotografía digital', 'icono': Icons.photo_camera},
            ],
          });
        }
      }
      _datosCargados = true;
    }
  }

  @override
  void dispose() {
    _logica.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final datos = _logica.datosEstudiante ?? {
      'nombre': 'Valeria Gómez',
      'edad': 20,
      'carrera': 'Ingeniería en Tecnologías de la Información',
      'cuatrimestre': '6° Cuatrimestre',
      'imagenUrl': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=800',
      'fraseInteres': '"Me interesaría encontrar a alguien con quien poder hacer extreme programming o alguien que enseñe sobre integrales y cálculo avanzado."',
      'tagsInteres': ['Pair Programming', 'Cálculo Multivariable', 'Estudio Colaborativo'],
      'buscaAprender': ['Cálculo avanzado', 'Física aplicada', 'Ecuaciones dif.'],
      'puedeEnsenar': ['Programación (Python/C)', 'Redes y Bases de datos', 'Estrategia de Ajedrez'],
      'hobbies': [
        {'titulo': 'Ajedrez', 'icono': Icons.pest_control},
        {'titulo': 'Desarrollo de videojuegos', 'icono': Icons.sports_esports},
        {'titulo': 'Senderismo', 'icono': Icons.hiking},
        {'titulo': 'Lectura de ciencia ficción', 'icono': Icons.auto_stories},
        {'titulo': 'Fotografía digital', 'icono': Icons.photo_camera},
      ],
    };

    final nombre = datos['nombre'] as String;

    return AnimatedBuilder(
      animation: _logica,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: colorSuperficie,
          appBar: _construirAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _construirTarjetaFotoHero(datos),
                  const SizedBox(height: 20),
                  _construirSeccionIntereses(datos),
                  const SizedBox(height: 20),
                  _construirSeccionBuscaYPuede(datos),
                  const SizedBox(height: 20),
                  _construirSeccionHobbies(datos),
                  const SizedBox(height: 28),
                  _construirBotonesAccionSeguridad(nombre),
                  const SizedBox(height: 16),
                ],
              ),
            ),
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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: colorTextoPrincipal, size: 22),
        onPressed: () => _logica.regresar(context),
      ),
      title: const Text(
        'Detalle de perfil',
        style: TextStyle(
          color: colorTextoPrincipal,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _construirTarjetaFotoHero(Map<String, dynamic> datos) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              datos['imagenUrl'] ?? '',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
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
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
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
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: colorEsmeraldaOscuro,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.verified, size: 14, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              'UPV Verificada',
                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.school, size: 14, color: Colors.white),
                            const SizedBox(width: 4),
                            Text(
                              datos['cuatrimestre'] ?? '6° Cuatrimestre',
                              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${datos['nombre']}, ${datos['edad']}',
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.code, size: 16, color: colorPrimarioClaro),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          datos['carrera'] ?? '',
                          style: const TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirSeccionIntereses(Map<String, dynamic> datos) {
    final tags = (datos['tagsInteres'] as List<dynamic>?)?.cast<String>() ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.psychology_alt, color: colorPrimario, size: 22),
            SizedBox(width: 6),
            Text('Intereses', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorTextoPrincipal)),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                datos['fraseInteres'] ?? '',
                style: const TextStyle(
                  fontSize: 13.5,
                  fontStyle: FontStyle.italic,
                  color: colorTextoPrincipal,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: colorPrimarioClaro,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorPrimario),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _construirSeccionBuscaYPuede(Map<String, dynamic> datos) {
    final busca = (datos['buscaAprender'] as List<dynamic>?)?.cast<String>() ?? [];
    final puede = (datos['puedeEnsenar'] as List<dynamic>?)?.cast<String>() ?? [];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.menu_book, size: 16, color: colorPrimario),
                    SizedBox(width: 6),
                    Text('BUSCA APRENDER', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: colorPrimario)),
                  ],
                ),
                const SizedBox(height: 8),
                ...busca.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          const CircleAvatar(radius: 3, backgroundColor: colorPrimario),
                          const SizedBox(width: 6),
                          Expanded(child: Text(item, style: const TextStyle(fontSize: 12, color: colorTextoPrincipal))),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.co_present, size: 16, color: colorPrimario),
                    SizedBox(width: 6),
                    Text('PUEDE ENSEÑAR', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: colorPrimario)),
                  ],
                ),
                const SizedBox(height: 8),
                ...puede.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          const CircleAvatar(radius: 3, backgroundColor: colorPrimario),
                          const SizedBox(width: 6),
                          Expanded(child: Text(item, style: const TextStyle(fontSize: 12, color: colorTextoPrincipal))),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _construirSeccionHobbies(Map<String, dynamic> datos) {
    final hobbies = datos['hobbies'] as List<dynamic>? ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.sports_esports, color: colorPrimario, size: 22),
            SizedBox(width: 6),
            Text('Hobbies y Pasatiempos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorTextoPrincipal)),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
          ),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: hobbies.map((item) {
              final titulo = item['titulo'] as String;
              final icono = item['icono'] as IconData;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F3FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icono, size: 16, color: colorPrimario),
                    const SizedBox(width: 6),
                    Text(titulo, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorTextoPrincipal)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _construirBotonesAccionSeguridad(String nombre) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () => _mostrarModalConfirmacionBloqueo(context, nombre),
            icon: const Icon(Icons.block, color: colorRojoBoton, size: 20),
            label: Text(
              'Bloquear a $nombre',
              style: const TextStyle(
                color: colorRojoBoton,
                fontWeight: FontWeight.bold,
                fontSize: 14.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEE2E2),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton.icon(
          onPressed: () => _logica.reportarPerfil(context, nombre),
          icon: const Icon(Icons.flag_outlined, size: 16, color: colorTextoAtenuado),
          label: const Text(
            'Reportar perfil por contenido inapropiado',
            style: TextStyle(color: colorTextoAtenuado, fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Ventana flotante de confirmacion de bloqueo con la estetica exacta
  void _mostrarModalConfirmacionBloqueo(BuildContext context, String nombre) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icono superior en circulo de alerta roja
                Container(
                  width: 58,
                  height: 58,
                  decoration: const BoxDecoration(
                    color: colorRojoFondoIcono,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.block, color: colorRojoBoton, size: 28),
                ),
                const SizedBox(height: 16),
                // Titulo principal
                const Text(
                  '¿Confirmar bloqueo?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorTituloModal,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitulo descriptivo dinamico
                Text(
                  'Ya no verás a $nombre en tu Swipe de ConectaUPV y el(ella) no podrá encontrarte ni enviarte mensajes.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: colorDescripcionModal,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                // Accion Primaria: Bloquear
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      _logica.procesarBloqueoUsuario(context, nombre);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorRojoBoton,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(
                      'Bloquear a $nombre',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Accion Secundaria: Cancelar
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorAzulBotonCancelar,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: colorTextoBotonCancelar,
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _construirNavegacionInferior() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: colorPrimario,
      unselectedItemColor: colorTextoSecundario,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorSuperficie,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Swipe'),
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Explorar'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
      ],
    );
  }
}