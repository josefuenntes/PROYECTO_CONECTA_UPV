import 'package:flutter/material.dart';
import 'bienvenida_logica.dart';

class BienvenidaRegistroDiseno extends StatefulWidget {
  const BienvenidaRegistroDiseno({super.key});

  @override
  State<BienvenidaRegistroDiseno> createState() => _BienvenidaRegistroDisenoState();
}

class _BienvenidaRegistroDisenoState extends State<BienvenidaRegistroDiseno> {
  late final BienvenidaRegistroLogica _logica;
  bool _datosCargados = false;

  // Paleta de colores oficial ConectaUPV
  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF630ED4);
  static const Color colorPrimarioContenedor = Color(0xFF7C3AED);
  static const Color colorPrimarioClaro = Color(0xFFEDE9FE);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorTextoAtenuado = Color(0xFF9CA3AF);
  static const Color colorEsmeraldaClaro = Color(0xFFD1FAE5);
  static const Color colorEsmeraldaOscuro = Color(0xFF059669);
  static const Color colorFondoTarjeta = Color(0xFFFFFFFF);
  static const Color colorSuperficieContenedorBajo = Color(0xFFF6F2FF);

  @override
  void initState() {
    super.initState();
    _logica = BienvenidaRegistroLogica();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_datosCargados) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      _logica.cargarDatos(args);
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
    return AnimatedBuilder(
      animation: _logica,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: colorSuperficie,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                children: [
                  _construirBadgePerfilActivado(),
                  const SizedBox(height: 16),
                  _construirAvatarConHaloInstitucional(),
                  const SizedBox(height: 12),
                  _construirEncabezadoBienvenidaDinamico(),
                  const SizedBox(height: 12),
                  _construirBannerFraseTransforma(),
                  const SizedBox(height: 12),
                  _construirSubtextoCuentaLista(),
                  const SizedBox(height: 20),
                  _construirTarjetaCredencialDigital(),
                  const SizedBox(height: 24),
                  _construirSeccionQuePuedesHacerHoy(),
                  const SizedBox(height: 28),
                  _construirBotonEntrarConectaUPV(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 1. Badge Superior "¡Perfil Activado con Exito!"
  Widget _construirBadgePerfilActivado() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: colorEsmeraldaClaro,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.verified, size: 16, color: colorEsmeraldaOscuro),
          SizedBox(width: 6),
          Text(
            '¡PERFIL ACTIVADO CON ÉXITO!',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: colorEsmeraldaOscuro,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  // 2. Avatar Universitario con Halo y Badges Institucionales
  Widget _construirAvatarConHaloInstitucional() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 110,
          height: 110,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [colorPrimario, colorPrimarioContenedor, Color(0xFF6CF8BB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: colorPrimarioClaro,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.face, size: 68, color: colorPrimario),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: colorEsmeraldaOscuro,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: const Icon(Icons.check, size: 18, color: Colors.white),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFFFDDB8),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
            ),
            child: Row(
              children: const [
                Icon(Icons.school, size: 13, color: Color(0xFF2A1700)),
                SizedBox(width: 3),
                Text(
                  'UPV',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF2A1700)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 3. Encabezado principal dinamico con el Nombre del usuario
  Widget _construirEncabezadoBienvenidaDinamico() {
    return Text(
      '¡Bienvenido, ${_logica.nombre}!',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: colorTextoPrincipal,
        letterSpacing: -0.5,
      ),
    );
  }

  // 4. Banner con frase motivacional institucional
  Widget _construirBannerFraseTransforma() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E5FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: '“Aprende, disfruta y sobre todo... ',
          style: TextStyle(
            color: colorPrimario,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: '¡transforma!”',
              style: TextStyle(
                color: Color(0xFF6B21A8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirSubtextoCuentaLista() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Tu cuenta institucional está lista. Ahora formas parte de la red de colaboración y tutorías de la UPV.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.5,
          color: colorTextoSecundario,
          height: 1.35,
        ),
      ),
    );
  }

  // 5. Tarjeta Credencial Digital con datos reales
  Widget _construirTarjetaCredencialDigital() {
    final nombreCompleto = '${_logica.nombre} ${_logica.apellidos}'.trim();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorFondoTarjeta,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        children: [
          // Franja superior degradada
          Container(
            height: 6,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [colorPrimario, colorPrimarioContenedor, colorEsmeraldaOscuro],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: colorSuperficieContenedorBajo,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.badge, size: 20, color: colorPrimario),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CREDENCIAL DIGITAL',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colorTextoAtenuado),
                          ),
                          Text(
                            nombreCompleto.isNotEmpty ? nombreCompleto : _logica.nombre,
                            style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorSuperficieContenedorBajo,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Carrera', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                                Text(
                                  _logica.carrera,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Rol Universitario', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                                Text(
                                  _logica.rolUniversitario,
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorPrimario),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Correo institucional', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                            Text(
                              _logica.correo,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorTextoSecundario),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 6. Tarjetas Informativas "¿Qué puedes hacer hoy?"
  Widget _construirSeccionQuePuedesHacerHoy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '¿Qué puedes hacer hoy?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
            ),
            Text(
              'Tus primeros pasos',
              style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: colorPrimario),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorFondoTarjeta,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: colorPrimarioClaro,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.diversity_3, size: 24, color: colorPrimarioContenedor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Descubre compañeros',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Desliza perfiles compatibles con tus materias y horarios.',
                      style: TextStyle(fontSize: 11.5, color: colorTextoSecundario),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: colorTextoAtenuado, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  // 7. Botón Principal "Entrar a ConectaUPV 🚀"
  Widget _construirBotonEntrarConectaUPV() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _logica.estaCargando ? null : () => _logica.entrarAConectaUPV(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimarioContenedor,
          elevation: 4,
          shadowColor: colorPrimarioContenedor.withValues(alpha: 0.35),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: _logica.estaCargando
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Entrar a ConectaUPV',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.rocket_launch, color: Colors.white, size: 20),
                ],
              ),
      ),
    );
  }
}