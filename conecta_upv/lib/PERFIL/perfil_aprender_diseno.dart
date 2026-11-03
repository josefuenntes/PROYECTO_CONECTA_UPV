import 'package:flutter/material.dart';
import 'perfil_aprender_logica.dart';

class PerfilAprenderDiseno extends StatefulWidget {
  const PerfilAprenderDiseno({super.key});

  @override
  State<PerfilAprenderDiseno> createState() => _PerfilAprenderDisenoState();
}

class _PerfilAprenderDisenoState extends State<PerfilAprenderDiseno> {
  late PerfilAprenderLogica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorFondoContenedor = Color(0xFFEFEBFF);

  @override
  void initState() {
    super.initState();
    _logica = PerfilAprenderLogica();
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
                  // Indicadores de progreso (Barra superior)
                  Row(
                    children: [
                      Expanded(child: Container(height: 4, decoration: BoxDecoration(color: colorPrimario, borderRadius: BorderRadius.circular(2)))),
                      const SizedBox(width: 4),
                      Expanded(child: Container(height: 4, decoration: BoxDecoration(color: colorPrimario, borderRadius: BorderRadius.circular(2)))),
                      const SizedBox(width: 4),
                      Expanded(child: Container(height: 4, decoration: BoxDecoration(color: colorPrimario, borderRadius: BorderRadius.circular(2)))),
                      const SizedBox(width: 4),
                      Expanded(child: Container(height: 4, decoration: BoxDecoration(color: const Color(0xFFE3DFFF), borderRadius: BorderRadius.circular(2)))),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Subtítulo con ícono académico
                  Row(
                    children: const [
                      Icon(Icons.school, size: 18, color: colorPrimario),
                      SizedBox(width: 6),
                      Text(
                        'METAS ACADÉMICAS',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: colorPrimario,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Título principal
                  const Text(
                    'QUIERO APRENDER O CONOCER...',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: colorTextoPrincipal,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Indica las materias, tecnologías o temas en los que buscas apoyo, tutorías o compañeros de estudio.',
                    style: TextStyle(fontSize: 13, color: colorTextoSecundario, height: 1.4),
                  ),
                  const SizedBox(height: 16),

                  // Sugerencias rápidas
                  const Row(
                    children: [
                      Icon(Icons.auto_awesome, size: 14, color: colorPrimario),
                      SizedBox(width: 4),
                      Text(
                        'Sugerencias rápidas para añadir:',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorTextoSecundario),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _construirChipSugerencia(
                          emoji: '💡',
                          texto: 'Cálculo Diferencial',
                          onTap: () => _logica.agregarTag('Cálculo Diferencial'),
                        ),
                        const SizedBox(width: 8),
                        _construirChipSugerencia(
                          emoji: '🐍',
                          texto: 'Python & IA',
                          onTap: () => _logica.agregarTag('Python & IA'),
                        ),
                        const SizedBox(width: 8),
                        _construirChipSugerencia(
                          emoji: '🌐',
                          texto: 'Redes & Telecom',
                          onTap: () => _logica.agregarTag('Redes & Telecom'),
                        ),
                        const SizedBox(width: 8),
                        _construirChipSugerencia(
                          emoji: '🎨',
                          texto: 'Diseño UX/UI',
                          onTap: () => _logica.agregarTag('Diseño UX/UI'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Caja de entrada principal
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
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: colorFondoContenedor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(Icons.lightbulb, size: 18, color: colorPrimario),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Temas de interés',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: colorTextoPrincipal,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: _logica.limpiarTexto,
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
                        const SizedBox(height: 12),

                        TextField(
                          controller: _logica.controllerObjetivos,
                          maxLength: _logica.maxCaracteres,
                          maxLines: 5,
                          style: const TextStyle(fontSize: 14, color: colorTextoPrincipal, height: 1.4),
                          decoration: const InputDecoration(
                            hintText: 'Escribe aquí los temas o retos académicos...',
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
                                const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: Color(0xFF10B981),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  esLimite ? 'Casi en el límite' : 'Longitud ideal',
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

                  // Consejo de visibilidad
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
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFFEADDFF),
                          child: Icon(Icons.tips_and_updates, color: Color(0xFF25005A), size: 18),
                        ),
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
                                'Ser específico con las materias y dudas concretas incrementa en un 50% las probabilidades de encontrar al tutor o compañero ideal.',
                                style: TextStyle(fontSize: 12, color: colorTextoSecundario, height: 1.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botón Guardar cambios
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
                      icon: const Icon(Icons.check, size: 20),
                      label: const Text('Guardar cambios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Botón Regresar
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
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 6),
            Text(
              texto,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
            ),
          ],
        ),
      ),
    );
  }
}