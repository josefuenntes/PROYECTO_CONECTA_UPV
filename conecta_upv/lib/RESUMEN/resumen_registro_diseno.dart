import 'package:flutter/material.dart';
import 'resumen_registro_logica.dart';



class ResumenDiseno extends StatefulWidget {
  const ResumenDiseno({super.key});

  @override
  State<ResumenDiseno> createState() => _ResumenDisenoState();
}

class _ResumenDisenoState extends State<ResumenDiseno> {
  late final ResumenLogica _logica;
  bool _datosCargados = false;

  // Paleta de colores oficial ConectaUPV
  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF630ED4);
  static const Color colorPrimarioContenedor = Color(0xFF7C3AED);
  static const Color colorPrimarioClaro = Color(0xFFEDE9FE);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorTextoAtenuado = Color(0xFF9CA3AF);
  static const Color colorEsmeraldaOscuro = Color(0xFF059669);
  static const Color colorAmbarClaro = Color(0xFFFEF3C7);
  static const Color colorTerciarioContenedor = Color(0xFF905B00);
  static const Color colorNaranjaAccento = Color(0xFFF97316);
  static const Color colorFondoTarjeta = Color(0xFFFFFFFF);
  static const Color colorSuperficieAlt = Color(0xFFF3F4F6);

  @override
  void initState() {
    super.initState();
    _logica = ResumenLogica();
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
          appBar: _construirAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Column(
                children: [
                  _construirTarjetaHeroBienvenida(),
                  const SizedBox(height: 16),
                  _construirFichaAcademicaOficial(),
                  const SizedBox(height: 16),
                  _construirSeccionCompetenciasIntereses(),
                  const SizedBox(height: 16),
                  _construirTarjetaAjustesInfo(),
                  const SizedBox(height: 24),
                  _construirZonaInferiorAcciones(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 1. AppBar superior
  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      backgroundColor: colorSuperficie.withOpacity(0.9),
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: colorTextoPrincipal, size: 20),
        onPressed: () => _logica.regresarAHabilidades(context),
      ),
      title: const Text(
        'RESUMEN DE PERFIL',
        style: TextStyle(
          color: colorTextoPrincipal,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 0.5,
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

  // 2. Tarjeta Hero con Saludo Dinamico (¡Hola, JOSE!) y Avatar
  Widget _construirTarjetaHeroBienvenida() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorPrimarioClaro.withOpacity(0.6),
            const Color(0xFFF6F2FF),
            colorSuperficie,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorPrimarioClaro),
      ),
      child: Column(
        children: [
          // Avatar con Badge Verificado
          Stack(
            children: [
              Container(
                width: 88,
                height: 88,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [colorPrimario, colorPrimarioContenedor, colorEsmeraldaOscuro],
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: colorPrimarioClaro,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.face, size: 56, color: colorPrimario),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: const Icon(Icons.verified, size: 18, color: colorEsmeraldaOscuro),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Badge Nombre preferido
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children:  [
                Icon(Icons.sentiment_very_satisfied, size: 15, color: colorPrimarioContenedor),
                SizedBox(width: 4),
                Text(
                  'Nombre preferido configurado',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B21A8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Saludo dinamico con el Nombre ingresado
          Text(
            '¡Hola, ${_logica.nombre}!',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B21A8),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Revisa tu información académica y confirma tu perfil para comenzar a conectar y estudiar en comunidad.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: colorTextoSecundario,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  // 3. Ficha Academica Oficial (Nombres, Matricula, Correo, Edad, Cuatrimestre, Carrera)
  Widget _construirFichaAcademicaOficial() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorFondoTarjeta,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera "Resumen Final" + Boton Editar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: colorPrimarioClaro,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.badge, size: 18, color: colorPrimarioContenedor),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Resumen Final',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorTextoPrincipal,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => _logica.editarPerfil(context),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: colorPrimarioClaro.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children:  [
                      Icon(Icons.edit, size: 14, color: colorPrimarioContenedor),
                      SizedBox(width: 4),
                      Text(
                        'Editar',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colorPrimarioContenedor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Subtarjeta Identidad y Nombres
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorPrimarioClaro.withOpacity(0.3),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Row(
                      children: [
                        Icon(Icons.account_circle, size: 18, color: colorPrimarioContenedor),
                        SizedBox(width: 6),
                        Text(
                          'Identidad y Nombres',
                          style: TextStyle(fontSize: 11, color: colorTextoAtenuado),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nombre / Apodo', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                          Text(
                            _logica.nombre,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Apellidos completos', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                          Text(
                            _logica.apellidos,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.sentiment_satisfied, size: 15, color: colorPrimarioContenedor),
                      const SizedBox(width: 6),
                      Text(
                        '¿Cómo le gusta que lo llamen?: ',
                        style: TextStyle(fontSize: 11.5, color: colorTextoSecundario),
                      ),
                      Text(
                        _logica.nombre,
                        style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: colorPrimario),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Grid Fila 1: Matricula y Correo
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorSuperficieAlt,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.numbers, size: 14, color: colorTextoAtenuado),
                          SizedBox(width: 4),
                          Text('Matrícula', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _logica.matricula,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorSuperficieAlt,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.mail_outline, size: 14, color: colorTextoAtenuado),
                          SizedBox(width: 4),
                          Text('Correo Institucional', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _logica.correo,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Grid Fila 2: Edad y Cuatrimestre
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorSuperficieAlt,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.cake, size: 14, color: colorTextoAtenuado),
                          SizedBox(width: 4),
                          Text('Edad', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${_logica.edad} años',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorSuperficieAlt,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.calendar_month, size: 14, color: colorTextoAtenuado),
                          SizedBox(width: 4),
                          Text('Cuatrimestre', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _logica.cuatrimestre,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorPrimarioContenedor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Carrera Universitaria
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorSuperficieAlt,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.school, size: 14, color: colorTextoAtenuado),
                    SizedBox(width: 4),
                    Text('Carrera Universitaria', style: TextStyle(fontSize: 11, color: colorTextoAtenuado)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _logica.carrera,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 4. Competencias e Intereses para el Match de Estudio
  Widget _construirSeccionCompetenciasIntereses() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorFondoTarjeta,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Puedes ensenar
          Row(
            children: const [
              Icon(Icons.psychology, size: 18, color: colorPrimarioContenedor),
              SizedBox(width: 6),
              Text(
                'Puedes enseñar o compartir',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _logica.puedoEnsenar.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: colorPrimarioContenedor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.check, size: 14, color: Colors.white),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 18),

          // Deseas aprender
          const Row(
            children:  [
              Icon(Icons.lightbulb_outline, size: 18, color: colorNaranjaAccento),
              SizedBox(width: 6),
              Text(
                'Deseas aprender o reforzar',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _logica.deseoAprender.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: colorAmbarClaro,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorTerciarioContenedor),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // 5. Tarjeta informativa de Ajustes
  Widget _construirTarjetaAjustesInfo() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEBFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.info_outline, color: colorPrimarioContenedor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: const TextSpan(
                text: '¿Algo necesita ajuste? ',
                style: TextStyle(color: colorTextoPrincipal, fontWeight: FontWeight.bold, fontSize: 12),
                children: [
                  TextSpan(
                    text: 'Podrás modificar tus materias, intereses y foto de perfil en cualquier momento desde los ajustes de tu cuenta.',
                    style: TextStyle(color: colorTextoSecundario, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 6. Botones CTA Inferiores
  Widget _construirZonaInferiorAcciones() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: _logica.estaCargando ? null : () => _logica.procesarFinalizarRegistro(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorPrimarioContenedor,
              elevation: 4,
              shadowColor: colorPrimarioContenedor.withOpacity(0.35),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: _logica.estaCargando
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Finalizar y Comenzar',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Text('🚀', style: TextStyle(fontSize: 18)),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton.icon(
          onPressed: () => _logica.regresarAHabilidades(context),
          icon: const Icon(Icons.arrow_back, size: 18, color: colorTextoSecundario),
          label: const Text(
            'Regresar a habilidades',
            style: TextStyle(color: colorTextoSecundario, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}