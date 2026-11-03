import 'package:flutter/material.dart';
import 'registro_paso_2_logica.dart';

class RegistroPaso2Diseno extends StatefulWidget {
  const RegistroPaso2Diseno({super.key});

  @override
  State<RegistroPaso2Diseno> createState() => _RegistroPaso2DisenoState();
}

class _RegistroPaso2DisenoState extends State<RegistroPaso2Diseno> {
  late final RegistroPaso2Logica _logica;

  // Constantes de diseño visual exactas
  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorPrimarioOscuro = Color(0xFF6D28D9);
  static const Color colorPrimarioClaro = Color(0xFFF3E8FF);
  static const Color colorTextoProfundo = Color(0xFF1E1B4B);
  static const Color colorTextoSecundario = Color(0xFF64748B);
  static const Color colorEsmeralda = Color(0xFF10B981);
  static const Color colorFondoInput = Color(0xFFF8FAFC);
  static const Color colorBordeInput = Color(0xFFE2E8F0);

  @override
  void initState() {
    super.initState();
    _logica = RegistroPaso2Logica();
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
                children: [
                  _construirEncabezadoSuperior(),
                  const SizedBox(height: 12),
                  _construirBarraProgresoSegmentada(),
                  const SizedBox(height: 16),
                  _construirTarjetaHeroAvatar(),
                  const SizedBox(height: 16),
                  _construirTarjetaFormularioPrincipal(),
                  const SizedBox(height: 24),
                  _construirBotonAccionSiguiente(),
                  const SizedBox(height: 12),
                  _construirPieSeguridadInstitucional(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 1. Encabezado superior con boton volver, marca y badge del paso
  Widget _construirEncabezadoSuperior() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => _logica.regresar(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorPrimarioClaro),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
                  ],
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16, color: colorTextoProfundo),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [colorPrimarioOscuro, colorPrimario]),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.hub, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 6),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'CONECTA ',
                        style: TextStyle(
                          color: colorTextoProfundo,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'UPV',
                        style: TextStyle(
                          color: colorPrimario,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colorPrimarioClaro,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorPrimario.withOpacity(0.2)),
          ),
          child: Row(
            children: const [
              Icon(Icons.circle, size: 6, color: colorPrimario),
              SizedBox(width: 6),
              Text(
                'PASO 2 DE 3',
                style: TextStyle(
                  color: colorPrimarioOscuro,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 2. Barra de progreso segmentada (2 activos, 1 inactivo)
  Widget _construirBarraProgresoSegmentada() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: colorPrimario,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: colorPrimario,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: colorPrimarioClaro,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  // 3. Tarjeta Hero con Avatar universitario y camara
  Widget _construirTarjetaHeroAvatar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorPrimarioClaro),
        boxShadow: [
          BoxShadow(
            color: colorPrimario.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [colorPrimario, Color(0xFFC084FC)]),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: colorPrimarioClaro,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.face, size: 52, color: colorPrimario),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () => _logica.cambiarFotoPerfil(context),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: colorPrimarioClaro),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                      ],
                    ),
                    child: const Icon(Icons.photo_camera, size: 15, color: colorPrimario),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Datos Académicos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorTextoProfundo,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Ingresa tus datos personales y escolares para personalizar tus matches y tutorías',
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

  // 4. Tarjeta del formulario (Matricula, Edad, Cuatrimestre, Carrera)
  Widget _construirTarjetaFormularioPrincipal() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorPrimarioClaro),
        boxShadow: [
          BoxShadow(
            color: colorPrimario.withOpacity(0.05),
            blurRadius: 25,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _construirFilaMatriculaYEdad(),
          const SizedBox(height: 18),
          _construirSeccionCuatrimestres(),
          const SizedBox(height: 18),
          _construirSeccionCarreraUniversitaria(),
        ],
      ),
    );
  }

  // 4.1 Fila dividida: Matricula (3/5) y Edad (2/5)
  Widget _construirFilaMatriculaYEdad() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Campo Matricula
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'MATRÍCULA',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: colorTextoProfundo,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.verified, size: 12, color: colorEsmeralda),
                      SizedBox(width: 2),
                      Text(
                        'VERIFICADA',
                        style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          color: colorEsmeralda,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: colorFondoInput,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorBordeInput),
                ),
                child: TextField(
                  controller: _logica.matriculaController,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: colorTextoProfundo,
                    letterSpacing: 0.5,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    suffixIcon: Icon(Icons.check_circle, size: 18, color: colorEsmeralda),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Dropdown Edad
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'EDAD',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: colorTextoProfundo,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: colorFondoInput,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorBordeInput),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: _logica.edadSeleccionada,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: colorTextoSecundario, size: 18),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: colorTextoProfundo,
                    ),
                    onChanged: _logica.seleccionarEdad,
                    items: _logica.listaEdades.map((int edad) {
                      return DropdownMenuItem<int>(
                        value: edad,
                        child: Text('$edad años'),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 4.2 Seleccion de Cuatrimestre con Badge e items
  Widget _construirSeccionCuatrimestres() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'CUATRIMESTRE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: colorTextoProfundo,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Grid de Cuatrimestres (Fila 1: 1 a 5, Fila 2: ESTADIA + 7, 8, 9)
        Column(
          children: [
            Row(
              children: ['1', '2', '3', '4', '5'].map((item) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: _construirBotonOpcionCuatrimestre(item),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: _construirBotonOpcionCuatrimestre('ESTADIA', esEstadia: true),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: _construirBotonOpcionCuatrimestre('7'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: _construirBotonOpcionCuatrimestre('8'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: _construirBotonOpcionCuatrimestre('9'),
                  ),
                  
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _construirBotonOpcionCuatrimestre(String texto, {bool esEstadia = false}) {
    final bool estaSeleccionado = _logica.cuatrimestreSeleccionado == texto;

    return SizedBox(
      height: 38,
      child: ElevatedButton(
        onPressed: () => _logica.seleccionarCuatrimestre(texto),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: estaSeleccionado ? colorPrimario : colorFondoInput,
          elevation: estaSeleccionado ? 3 : 0,
          shadowColor: colorPrimario.withOpacity(0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: estaSeleccionado ? colorPrimario : colorBordeInput,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (esEstadia) ...[
              Icon(
                Icons.school,
                size: 14,
                color: estaSeleccionado ? Colors.white : colorTextoProfundo,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              texto,
              style: TextStyle(
                fontSize: esEstadia ? 11.5 : 13,
                fontWeight: FontWeight.bold,
                color: estaSeleccionado ? Colors.white : colorTextoProfundo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4.3 Dropdown Carrera Universitaria
  Widget _construirSeccionCarreraUniversitaria() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CARRERA UNIVERSITARIA',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: colorTextoProfundo,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: colorFondoInput,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorBordeInput),
          ),
          child: Row(
            children: [
              const Icon(Icons.terminal, color: colorPrimario, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _logica.carreraSeleccionada,
                    isExpanded: true,
                    icon: const Icon(Icons.expand_more, color: colorTextoSecundario, size: 20),
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: colorTextoProfundo,
                    ),
                    onChanged: _logica.seleccionarCarrera,
                    items: _logica.listaCarreras.map((String carrera) {
                      return DropdownMenuItem<String>(
                        value: carrera,
                        child: Text(
                          carrera,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 5. Boton de accion principal "Siguiente ->"
  Widget _construirBotonAccionSiguiente() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
// Dentro de _construirBotonAccionSiguiente:
  onPressed: _logica.estaCargando
      ? null
      : () {
          final datosPaso1 = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
          _logica.procesarSiguiente(context, datosPaso1);
        },
                style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimario,
          elevation: 4,
          shadowColor: colorPrimario.withOpacity(0.35),
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
                    'Siguiente',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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

  // 6. Pie de seguridad e informacion
  Widget _construirPieSeguridadInstitucional() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.lock_outline, size: 14, color: colorEsmeralda),
        const SizedBox(width: 6),
        RichText(
          text: const TextSpan(
            text: 'Tus datos están protegidos por el portal universitario ',
            style: TextStyle(
              color: colorTextoSecundario,
              fontSize: 11,
              fontWeight: FontWeight.w500,
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
    );
  }
}