import 'package:flutter/material.dart';
import 'registro_paso_1_logica.dart';

class RegistroPaso1Diseno extends StatefulWidget {
  const RegistroPaso1Diseno({super.key});

  @override
  State<RegistroPaso1Diseno> createState() => _RegistroPaso1DisenoState();
}

class _RegistroPaso1DisenoState extends State<RegistroPaso1Diseno> {
  late final RegistroPaso1Logica _logica;

  // Paleta de colores oficial ConectaUPV
  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF630ED4);
  static const Color colorPrimarioContenedor = Color(0xFF7C3AED);
  static const Color colorPrimarioClaro = Color(0xFFEDE9FE);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorTextoAtenuado = Color(0xFF9CA3AF);
  static const Color colorError = Color(0xFFBA1A1A);
  static const Color colorEsmeraldaClaro = Color(0xFFD1FAE5);
  static const Color colorEsmeraldaOscuro = Color(0xFF059669);
  static const Color colorAmbarClaro = Color(0xFFFEF3C7);
  static const Color colorTerciario = Color(0xFF704500);
  static const Color colorContenedorBlanco = Color(0xFFFFFFFF);
  static const Color colorContenedorBajo = Color(0xFFF6F2FF);
  static const Color colorContenedorAlto = Color(0xFFE9E5FF);

  @override
  void initState() {
    super.initState();
    _logica = RegistroPaso1Logica();
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
                  _construirBarraIdentidadUPV(),
                  const SizedBox(height: 16),
                  _construirIndicadorProgresoPaso(),
                  const SizedBox(height: 20),
                  _construirBannerBienvenidaHero(),
                  const SizedBox(height: 20),
                  _construirFormularioRegistro(),
                  const SizedBox(height: 24),
                  _construirPieIniciaSesion(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 1. Barra superior AppBar
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

  // 2. Barra de identidad institucional UPV
  Widget _construirBarraIdentidadUPV() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: colorPrimario,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: colorPrimario.withOpacity(0.25),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(Icons.hub, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'CONECTA',
                    style: TextStyle(
                      color: colorPrimario,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: ' UPV',
                    style: TextStyle(
                      color: colorTextoPrincipal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Comunidad Politécnica',
              style: TextStyle(color: colorTextoAtenuado, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }

  // 3. Indicador visual de progreso paso 1 de 3
  Widget _construirIndicadorProgresoPaso() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Registro de cuenta',
              style: TextStyle(
                color: colorTextoSecundario,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: colorPrimario.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.circle, size: 6, color: colorPrimario),
                  SizedBox(width: 6),
                  Text(
                    'Paso 1 de 3',
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
            Expanded(
              child: Container(
                height: 6,
                decoration: BoxDecoration(
                  color: colorPrimario,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 6,
                decoration: BoxDecoration(
                  color: colorContenedorAlto,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 6,
                decoration: BoxDecoration(
                  color: colorContenedorAlto,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 4. Banner promocional Hero con Mascota Jaguar
  Widget _construirBannerBienvenidaHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            colorPrimarioClaro,
            colorContenedorBlanco,
            colorContenedorAlto,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorEsmeraldaClaro,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.circle, size: 6, color: colorEsmeraldaOscuro),
                      SizedBox(width: 6),
                      Text(
                        'Nuevo Ingreso',
                        style: TextStyle(
                          color: colorEsmeraldaOscuro,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Crea una cuenta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: colorTextoPrincipal,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Encuentra a tu equipo, colabora y comparte lo que sabes en el campus.',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorTextoSecundario,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD1rBqQJ-AkzVvMZ6v018h8A-iiEFlLQpsO9sG_ls9IxqZYBeIc7PECicpDq1ObOfkAyuubHETep0IPSgJg04REaAnqSC2iUFScpEhWDN74atGIJzgUsogEfWuVQTGRa37qs4TwZEHyoDp1wlEq-B27LsO_LA_01NuqiMSFlCk8y7Mw_arIq-B3MoKrRwC5zQlpHJJr_SacsrhAB_2Lop-JjGnfpxewtHi6FgQ39Zg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 40, color: colorPrimario),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 5. Formulario agrupado
  Widget _construirFormularioRegistro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _construirEtiquetaCampo('Nombre(s):', obligatorio: true),
        const SizedBox(height: 4),
        _construirCampoEntradaTexto(
          controller: _logica.nombreController,
          icono: Icons.person_outline,
          placeholder: 'Tu nombre',
        ),
        const SizedBox(height: 16),

        _construirEtiquetaCampo('Apellidos:', obligatorio: true),
        const SizedBox(height: 4),
        _construirCampoEntradaTexto(
          controller: _logica.apellidosController,
          icono: Icons.badge_outlined,
          placeholder: 'Tus apellidos',
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _construirEtiquetaCampo('¿Cómo te gusta que te llamen?:', obligatorio: false),
            const Text('Opcional', style: TextStyle(color: colorTextoAtenuado, fontSize: 11)),
          ],
        ),
        const SizedBox(height: 4),
        _construirCampoEntradaTexto(
          controller: _logica.aliasController,
          icono: Icons.sentiment_satisfied_outlined,
          placeholder: 'Ej. Josema, Zeus, Joss, Ari',
        ),
        const SizedBox(height: 12),

        _construirTarjetaCheckboxAlias(),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _construirEtiquetaCampo('Correo institucional:', obligatorio: true),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: colorAmbarClaro,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.verified_user, size: 12, color: Color(0xFFF97316)),
                  SizedBox(width: 4),
                  Text(
                    'Solo @upv.edu.mx',
                    style: TextStyle(
                      color: colorTerciario,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        _construirCampoEntradaTexto(
          controller: _logica.correoController,
          icono: Icons.alternate_email,
          placeholder: 'matricula@upv.edu.mx',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        _construirEtiquetaCampo('Contraseña:', obligatorio: true),
        const SizedBox(height: 4),
        _construirCampoEntradaTexto(
          controller: _logica.passwordController,
          icono: Icons.lock_outline,
          placeholder: 'Crea una contraseña',
          esPassword: true,
          ocultarTexto: _logica.ocultarPassword,
          onTogglePassword: _logica.alternarVisibilidadPassword,
        ),
        const SizedBox(height: 16),

        _construirEtiquetaCampo('Confirmar Contraseña:', obligatorio: true),
        const SizedBox(height: 4),
        _construirCampoEntradaTexto(
          controller: _logica.confirmPasswordController,
          icono: Icons.lock_reset,
          placeholder: 'Repite tu contraseña',
          esPassword: true,
          ocultarTexto: _logica.ocultarConfirmPassword,
          onTogglePassword: _logica.alternarVisibilidadConfirmPassword,
        ),
        const SizedBox(height: 24),

        _construirBotonRegistro(),
      ],
    );
  }

  // Componentes modulares reutilizables
  Widget _construirEtiquetaCampo(String texto, {required bool obligatorio}) {
    return RichText(
      text: TextSpan(
        text: texto,
        style: const TextStyle(
          color: colorTextoPrincipal,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
        children: [
          if (obligatorio)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: colorError, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Widget _construirCampoEntradaTexto({
    required TextEditingController controller,
    required IconData icono,
    required String placeholder,
    bool esPassword = false,
    bool ocultarTexto = false,
    VoidCallback? onTogglePassword,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: colorContenedorBlanco,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: esPassword ? ocultarTexto : false,
        keyboardType: keyboardType,
        style: const TextStyle(color: Color(0xFF111827), fontSize: 14),
        decoration: InputDecoration(
          prefixIcon: Icon(icono, color: colorTextoAtenuado, size: 20),
          suffixIcon: esPassword
              ? IconButton(
                  icon: Icon(
                    ocultarTexto ? Icons.visibility : Icons.visibility_off,
                    color: colorTextoAtenuado,
                    size: 20,
                  ),
                  onPressed: onTogglePassword,
                )
              : null,
          hintText: placeholder,
          hintStyle: const TextStyle(color: colorTextoAtenuado, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _construirTarjetaCheckboxAlias() {
    return GestureDetector(
      onTap: () => _logica.alternarGuardarAlias(!_logica.guardarAliasEnPerfil),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorContenedorBajo,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: _logica.guardarAliasEnPerfil,
                onChanged: _logica.alternarGuardarAlias,
                activeColor: colorPrimario,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                '¿Te gustaría que te guardemos así como te gusta que te digan en tu perfil público?',
                style: TextStyle(
                  color: colorTextoSecundario,
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirBotonRegistro() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _logica.estaCargando ? null : () => _logica.procesarRegistro(context),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          shadowColor: colorPrimario.withOpacity(0.3),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [colorPrimario, colorPrimarioContenedor],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            alignment: Alignment.center,
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
      ),
    );
  }

  Widget _construirPieIniciaSesion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿Ya tienes cuenta? ',
          style: TextStyle(color: colorTextoSecundario, fontSize: 14),
        ),
        GestureDetector(
          onTap: () => _logica.irAIniciarSesion(context),
          child: const Text(
            'Inicia sesión',
            style: TextStyle(
              color: colorPrimario,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}