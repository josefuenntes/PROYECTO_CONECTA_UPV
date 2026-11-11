import 'package:flutter/material.dart';
import 'registro_paso_3_logica.dart';

class RegistroPaso3Diseno extends StatefulWidget {
  const RegistroPaso3Diseno({super.key});

  @override
  State<RegistroPaso3Diseno> createState() => _RegistroPaso3DisenoState();
}

class _RegistroPaso3DisenoState extends State<RegistroPaso3Diseno> {
  late final RegistroPaso3Logica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF630ED4);
  static const Color colorPrimarioContenedor = Color(0xFF7C3AED);
  static const Color colorPrimarioClaro = Color(0xFFEDE9FE);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorTextoAtenuado = Color(0xFF9CA3AF);
  static const Color colorEsmeraldaClaro = Color(0xFFD1FAE5);
  static const Color colorEsmeraldaOscuro = Color(0xFF059669);
  static const Color colorAmbarClaro = Color(0xFFFEF3C7);
  static const Color colorTerciarioContenedor = Color(0xFF905B00);
  static const Color colorContenedorBlanco = Color(0xFFFFFFFF);
  static const Color colorContenedorBajo = Color(0xFFF6F2FF);

  @override
  void initState() {
    super.initState();
    _logica = RegistroPaso3Logica();
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _construirIndicadorProgresoPaso(),
                  const SizedBox(height: 16),
                  _construirBannerHeroCuestionario(),
                  const SizedBox(height: 24),
                  _construirSeccionPuedoEnsenar(),
                  const SizedBox(height: 24),
                  _construirSeccionDeseoAprender(),
                  const SizedBox(height: 24),
                  _construirTarjetaMatchingInfo(),
                  const SizedBox(height: 28),
                  _construirBotonFinalizar(),
                  const SizedBox(height: 12),
                  _construirSubtextoPie(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
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
        icon: const Icon(Icons.arrow_back_ios_new, color: colorTextoPrincipal, size: 20),
        onPressed: () => _logica.regresar(context),
      ),
      title: const Text(
        'Registro   Conectaupv',
        style: TextStyle(
          color: colorTextoPrincipal,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: colorPrimario,
            child: Icon(Icons.person, size: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _construirIndicadorProgresoPaso() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Habilidades e Intereses',
              style: TextStyle(
                color: colorTextoSecundario,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: colorPrimarioClaro,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.circle, size: 6, color: colorPrimarioContenedor),
                  SizedBox(width: 6),
                  Text(
                    'Paso 2 de 2',
                    style: TextStyle(
                      color: colorPrimario,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _construirBarraProgresoIluminada()),
            const SizedBox(width: 8),
            Expanded(child: _construirBarraProgresoIluminada()),
          ],
        ),
      ],
    );
  }

  Widget _construirBarraProgresoIluminada() {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: colorPrimarioContenedor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: colorPrimarioContenedor.withOpacity(0.45),
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Widget _construirBannerHeroCuestionario() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorContenedorBlanco,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorPrimarioContenedor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [colorPrimarioContenedor, Color(0xFF6B21A8), colorPrimarioClaro],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colorPrimarioContenedor.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.psychology, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'CUESTIONARIO INICIAL',
                  style: TextStyle(
                    color: colorPrimario,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.5,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Habilidades e Intereses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorTextoPrincipal,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Selecciona las materias y habilidades en las que puedes asesorar o deseas aprender.',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorTextoSecundario,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirSeccionPuedoEnsenar() {
    final seleccionados = _logica.puedoEnsenarSeleccionados;
    final disponibles = _logica.habilidadesEnsenarDisponibles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: colorEsmeraldaClaro,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.school, size: 16, color: colorEsmeraldaOscuro),
            ),
            const SizedBox(width: 8),
            const Text(
              '¿En qué eres bueno? / Puedo enseñar',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                color: colorTextoPrincipal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: disponibles.map((habilidad) {
            final esActivo = seleccionados.contains(habilidad);
            return _construirChipOpcion(
              texto: habilidad,
              esActivo: esActivo,
              onTap: () => _logica.alternarHabilidadEnsenar(habilidad),
              onEliminar: () => _logica.eliminarHabilidadEnsenar(habilidad),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        _construirCampoAgregarCustom(
          controller: _logica.customEnsenarController,
          placeholder: 'Agregar otra habilidad (ej. Física, Python)...',
          icono: Icons.add_circle_outline,
          onAdd: _logica.agregarHabilidadPersonalizada,
        ),
      ],
    );
  }

  Widget _construirSeccionDeseoAprender() {
    final seleccionados = _logica.deseoAprenderSeleccionados;
    final disponibles = _logica.interesesAprenderDisponibles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: colorAmbarClaro,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.trending_up, size: 16, color: colorTerciarioContenedor),
            ),
            const SizedBox(width: 8),
            const Text(
              '¿Qué quieres aprender o reforzar?',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                color: colorTextoPrincipal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: disponibles.map((interes) {
            final esActivo = seleccionados.contains(interes);
            return _construirChipOpcion(
              texto: interes,
              esActivo: esActivo,
              onTap: () => _logica.alternarInteresAprender(interes),
              onEliminar: () => _logica.eliminarInteresAprender(interes),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        _construirCampoAgregarCustom(
          controller: _logica.customAprenderController,
          placeholder: 'Agregar interés específico (ej. IA)...',
          icono: Icons.lightbulb_outline,
          onAdd: _logica.agregarInteresPersonalizado,
        ),
      ],
    );
  }

  Widget _construirChipOpcion({
    required String texto,
    required bool esActivo,
    required VoidCallback onTap,
    required VoidCallback onEliminar,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: 40,
      padding: const EdgeInsets.only(left: 14, right: 8),
      decoration: BoxDecoration(
        color: esActivo ? colorPrimarioContenedor : colorContenedorBlanco,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          if (esActivo)
            BoxShadow(
              color: colorPrimarioContenedor.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          else
            const BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  texto,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: esActivo ? Colors.white : colorTextoSecundario,
                  ),
                ),
                if (esActivo) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.check, size: 16, color: Colors.white),
                ],
              ],
            ),
          ),
          const SizedBox(width: 6),
          InkWell(
            onTap: onEliminar,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.close,
                size: 16,
                color: esActivo ? Colors.white.withOpacity(0.85) : colorTextoAtenuado,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirCampoAgregarCustom({
    required TextEditingController controller,
    required String placeholder,
    required IconData icono,
    required VoidCallback onAdd,
  }) {
    return Container(
      height: 44,
      padding: const EdgeInsets.only(left: 12, right: 6),
      decoration: BoxDecoration(
        color: colorContenedorBlanco,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        children: [
          Icon(icono, color: colorTextoAtenuado, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (_) => onAdd(),
              style: const TextStyle(fontSize: 13, color: colorTextoPrincipal),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: const TextStyle(fontSize: 12.5, color: colorTextoAtenuado),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          InkWell(
            onTap: onAdd,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colorContenedorBajo,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Añadir',
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                  color: colorPrimario,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirTarjetaMatchingInfo() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorContenedorBajo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: colorContenedorBlanco,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.groups, color: colorPrimario, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: const TextSpan(
                text: 'Tus preferencias alimentan el algoritmo de compatibilidad académica de ',
                style: TextStyle(color: colorTextoSecundario, fontSize: 12, height: 1.3),
                children: [
                  TextSpan(
                    text: 'ConectaUPV',
                    style: TextStyle(color: colorTextoPrincipal, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirBotonFinalizar() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _logica.estaCargando
            ? null
            : () {
                final datosAnteriores = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
                _logica.procesarFinalizarPerfil(context, datosAnteriores);
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimarioContenedor,
          elevation: 4,
          shadowColor: colorPrimarioContenedor.withOpacity(0.35),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: _logica.estaCargando
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Finalizar mi perfil',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ],
              ),
      ),
    );
  }

  Widget _construirSubtextoPie() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Tus preferencias te ayudarán a conectar con los mejores tutores y compañeros de campus.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorTextoAtenuado,
            fontSize: 11.5,
          ),
        ),
      ),
    );
  }
}