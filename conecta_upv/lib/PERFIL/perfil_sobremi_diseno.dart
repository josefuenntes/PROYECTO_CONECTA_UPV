import 'package:flutter/material.dart';
import 'perfil_sobremi_logica.dart';

class PerfilSobreMiDiseno extends StatefulWidget {
  const PerfilSobreMiDiseno({super.key});

  @override
  State<PerfilSobreMiDiseno> createState() => _PerfilSobreMiDisenoState();
}

class _PerfilSobreMiDisenoState extends State<PerfilSobreMiDiseno> {
  late PerfilSobreMiLogica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorFondoContenedor = Color(0xFFEFEBFF);

  @override
  void initState() {
    super.initState();
    _logica = PerfilSobreMiLogica();
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
        final esLimite = _logica.caracteresActuales > 900;

        return Scaffold(
          backgroundColor: colorSuperficie,
          appBar: AppBar(
            backgroundColor: colorSuperficie.withOpacity(0.9),
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: colorTextoPrincipal),
              onPressed: () => _logica.regresar(context),
            ),
            title: const Text(
              'Biografía',
              style: TextStyle(
                color: colorTextoPrincipal,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AGREGA TU BIO',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: colorTextoPrincipal,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Cuéntale a la comunidad universitaria sobre tus intereses, proyectos y pasatiempos.',
                    style: TextStyle(fontSize: 13, color: colorTextoSecundario, height: 1.4),
                  ),
                  const SizedBox(height: 16),

                  // Sugerencias rápidas
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _construirChipSugerencia(
                          emoji: '🚀',
                          texto: 'Proyectos & Hackathones',
                          colorFondo: const Color(0xFFEDE9FE),
                          colorTexto: colorPrimario,
                          onTap: () => _logica.agregarSugerencia('🚀 Buscando equipo para hackathones!'),
                        ),
                        const SizedBox(width: 8),
                        _construirChipSugerencia(
                          emoji: '☕',
                          texto: 'Vida en campus',
                          colorFondo: const Color(0xFFFEF3C7),
                          colorTexto: const Color(0xFF704500),
                          onTap: () => _logica.agregarSugerencia('☕ Amante de las cafeterías del campus.'),
                        ),
                        const SizedBox(width: 8),
                        _construirChipSugerencia(
                          emoji: '🏸',
                          texto: 'Deportes UPV',
                          colorFondo: const Color(0xFFD1FAE5),
                          colorTexto: const Color(0xFF059669),
                          onTap: () => _logica.agregarSugerencia('🏸 Jugador aficionado en el polideportivo.'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Caja de Texto
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.description, size: 18, color: colorPrimario),
                                SizedBox(width: 6),
                                Text(
                                  'Sobre mí',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: colorTextoPrincipal,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: _logica.limpiarBio,
                              child: Row(
                                children: const [
                                  Icon(Icons.backspace_outlined, size: 14, color: colorTextoSecundario),
                                  SizedBox(width: 4),
                                  Text('Limpiar', style: TextStyle(fontSize: 12, color: colorTextoSecundario)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 20, color: Color(0xFFF3F4F6)),

                        TextField(
                          controller: _logica.controllerBio,
                          maxLength: _logica.maxCaracteres,
                          maxLines: 6,
                          style: const TextStyle(fontSize: 14, color: colorTextoPrincipal, height: 1.4),
                          decoration: const InputDecoration(
                            hintText: 'Escribe sobre ti, qué te apasiona, qué proyectos buscas o qué te gusta hacer en el campus...',
                            hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),

                        const Divider(height: 16, color: Color(0xFFF3F4F6)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 4,
                                  backgroundColor: esLimite ? Colors.red : colorPrimario,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  esLimite ? 'Casi en el límite de caracteres' : 'Longitud ideal para tu perfil',
                                  style: const TextStyle(fontSize: 11, color: colorTextoSecundario),
                                ),
                              ],
                            ),
                            Text(
                              '${_logica.caracteresActuales} / ${_logica.maxCaracteres}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: esLimite ? Colors.red : colorTextoSecundario,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Consejos
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colorFondoContenedor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorPrimario.withOpacity(0.1)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.lightbulb, color: colorPrimario, size: 20),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Consejo de visibilidad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: colorTextoPrincipal,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Mencionar tus asignaturas favoritas o sociedades de alumnos aumenta un 40% las invitaciones a proyectos y grupos de estudio.',
                                style: TextStyle(fontSize: 12, color: colorTextoSecundario, height: 1.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botones de acción
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimario,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () => _logica.guardarCambios(context),
                      icon: const Icon(Icons.check_circle, size: 20),
                      label: const Text('Guardar cambios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF3EEFF),
                        foregroundColor: colorTextoPrincipal,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: const BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                      ),
                      onPressed: () => _logica.regresar(context),
                      icon: const Icon(Icons.arrow_back, size: 18),
                      label: const Text('Regresar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _construirChipSugerencia({
    required String emoji,
    required String texto,
    required Color colorFondo,
    required Color colorTexto,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: colorFondo,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 13)),
            const SizedBox(width: 6),
            Text(
              texto,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: colorTexto),
            ),
          ],
        ),
      ),
    );
  }
}