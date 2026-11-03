import 'package:flutter/material.dart';
import 'intro_logica.dart';

class IntroduccionDiseno extends StatefulWidget {
  const IntroduccionDiseno({super.key});

  @override
  State<IntroduccionDiseno> createState() => _IntroduccionDisenoState();
}

class _IntroduccionDisenoState extends State<IntroduccionDiseno> {
  late final IntroduccionLogica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF630ED4);
  static const Color colorPrimarioContenedor = Color(0xFF7C3AED);
  static const Color colorPrimarioClaro = Color(0xFFEDE9FE);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorTextoAtenuado = Color(0xFF9CA3AF);
  static const Color colorEsmeraldaOscuro = Color(0xFF059669);
  static const Color colorNaranjaAcento = Color(0xFFF97316);

  @override
  void initState() {
    super.initState();
    _logica = IntroduccionLogica();
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),

                  // Badge Superior: Plataforma Oficial
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEBFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.circle, size: 8, color: Color(0xFF006C49)),
                        SizedBox(width: 8),
                        Text(
                          'PLATAFORMA OFICIAL UPV',
                          style: TextStyle(
                            color: colorPrimario,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.verified, size: 15, color: colorNaranjaAcento),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Logo ConectaUPV
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [colorPrimario, colorPrimarioContenedor],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: colorPrimario.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.hub,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -4,
                        right: -4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 4),
                            ],
                          ),
                          child: const Icon(
                            Icons.school,
                            size: 16,
                            color: Color(0xFF006C49),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Título
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'CONECTA ',
                          style: TextStyle(
                            color: colorTextoPrincipal,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        TextSpan(
                          text: 'UPV',
                          style: TextStyle(
                            color: colorPrimario,
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Subtítulo
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Únete y encuentra a tu compañero perfecto para el estudio y tutorías',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorTextoSecundario,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Imagen Central Mascota + Badges Flotantes
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 256,
                          height: 256,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colorPrimarioClaro.withOpacity(0.7),
                                const Color(0xFFEFEBFF),
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(128),
                          child: Container(
                            width: 240,
                            height: 240,
                            color: const Color(0xFFE9E5FF),
                            child: Image.network(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuB5YCbxYOPDLFfGRK4VFSaeVewzzrUMSHJzWuK9EqclAQXGP_hYET9_KRSHa_GcRz9pAmla_TjNWZ512Baw-jO-hYGcUacNn7BS__6gm_jbXBUc1XOXUlmfyRQ0XPhYBUa__qpjriYn1mIGeNiWiD17TrQknnioXuL4f2L3RTN-fBHUHsDxLdi7e7I5xwrgRu-tScsMQxWHvOcTqWBCJ6bjc97sCtcti8B1lvh1Z3M',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.pets, size: 80, color: colorPrimario);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                              ],
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.groups, size: 16, color: Color(0xFF006C49)),
                                SizedBox(width: 6),
                                Text(
                                  '+1,200 Alumnos',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: colorTextoPrincipal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                              ],
                            ),
                            child: const Text(
                              'Match Académico',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: colorTextoPrincipal,
                                ),
                              ),
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                              ],
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.circle, size: 8, color: colorEsmeraldaOscuro),
                                SizedBox(width: 6),
                                Text(
                                  'Tutorías 24/7',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: colorTextoPrincipal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Chips de Capacidades
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _crearChipCapacidad(Icons.menu_book, 'Repaso grupal', colorPrimario),
                      _crearChipCapacidad(Icons.code, 'Proyectos IT', const Color(0xFF006C49)),
                      _crearChipCapacidad(Icons.psychology, 'Exámenes', colorNaranjaAcento),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // Botón Iniciar Sesión
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () => _logica.irAIniciarSesion(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimario,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 4,
                        shadowColor: colorPrimario.withOpacity(0.35),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Botón Crear Cuenta
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () => _logica.irACrearCuenta(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 1,
                        shadowColor: Colors.black12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person_add_outlined, color: colorPrimario, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Crear cuenta',
                            style: TextStyle(
                              color: colorPrimario,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Nota al Pie
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock_outline, size: 16, color: colorTextoAtenuado),
                      const SizedBox(width: 6),
                      RichText(
                        text: const TextSpan(
                          text: 'Acceso exclusivo con correo institucional ',
                          style: TextStyle(
                            color: colorTextoAtenuado,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '@upv.edu.mx',
                              style: TextStyle(
                                color: colorPrimario,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

  Widget _crearChipCapacidad(IconData icono, String texto, Color colorIcono) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 15, color: colorIcono),
          const SizedBox(width: 6),
          Text(
            texto,
            style: const TextStyle(
              color: colorTextoSecundario,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}