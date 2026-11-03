import 'package:flutter/material.dart';
import 'login_logica.dart';

class LoginDiseno extends StatefulWidget {
  const LoginDiseno({super.key});

  @override
  State<LoginDiseno> createState() => _LoginDisenoState();
}

class _LoginDisenoState extends State<LoginDiseno> {
  late final LoginLogica _logica;

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
  static const Color colorContenedorBlanco = Color(0xFFFFFFFF);
  static const Color colorContenedorBajo = Color(0xFFEFEBFF);

  @override
  void initState() {
    super.initState();
    _logica = LoginLogica();
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
                  _construirBadgesSuperiores(),
                  const SizedBox(height: 16),
                  _construirHeroCardBienvenida(),
                  const SizedBox(height: 20),
                  _construirCampoCorreo(),
                  const SizedBox(height: 16),
                  _construirCampoPassword(),
                  const SizedBox(height: 12),
                  _construirOpcionRecordar(),
                  const SizedBox(height: 20),
                  _construirBotonEntrar(),
                  const SizedBox(height: 28),
                  _construirSeccionCrearCuenta(),
                  const SizedBox(height: 16),
                  _construirBannerEstudiantesConectados(),
                  const SizedBox(height: 28),
                  _construirPieInstitucional(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 1. AppBar
  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      backgroundColor: colorSuperficie.withOpacity(0.9),
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
  icon: const Icon(Icons.arrow_back, color: colorTextoPrincipal),
  tooltip: 'Ir al inicio',
  onPressed: () => _logica.irAIntro(context), // 👈 Fuerza la ida a INTRO ('/')
),
      title: const Text(
        'Conectaupv Login',
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

  // 2. Badges superiores ("UPV AUTENTICACIÓN SEGURA" y "Portal Activo")
  Widget _construirBadgesSuperiores() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: colorPrimarioClaro,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: const [
              Icon(Icons.verified_user, size: 14, color: colorPrimario),
              SizedBox(width: 6),
              Text(
                'UPV AUTENTICACIÓN SEGURA',
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: colorTextoPrincipal,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: colorEsmeraldaClaro,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: const [
              Icon(Icons.circle, size: 8, color: colorEsmeraldaOscuro),
              SizedBox(width: 6),
              Text(
                'Portal Activo',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: colorEsmeraldaOscuro,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 3. Hero Card ("Bienvenido de nuevo")
  Widget _construirHeroCardBienvenida() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorPrimarioClaro.withOpacity(0.5),
            const Color(0xFFE8FAF1).withOpacity(0.4),
            colorContenedorBlanco,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorPrimarioClaro.withOpacity(0.6)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: colorContenedorBlanco,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
                  ],
                ),
                child: const Icon(Icons.school, size: 38, color: colorPrimario),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: colorPrimarioContenedor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: const Icon(Icons.lock_outlined, size: 14, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Bienvenido de nuevo',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: colorTextoPrincipal,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  // 4. Campo de Correo Institucional
  Widget _construirCampoCorreo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: 'Correo institucional: ',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: colorTextoPrincipal),
            children: [
              TextSpan(text: '*', style: TextStyle(color: colorPrimario, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 52,
          decoration: BoxDecoration(
            color: colorContenedorBlanco,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
          ),
          child: TextField(
            controller: _logica.correoController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 14, color: colorTextoPrincipal),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.badge_outlined, color: colorPrimario, size: 22),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  // 5. Campo de Contraseña y link "¿Olvidaste tu contraseña?"
  Widget _construirCampoPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Contraseña: ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: colorTextoPrincipal),
                children: [
                  TextSpan(text: '*', style: TextStyle(color: colorPrimario, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _logica.olvidePassword(context),
              child: const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: colorPrimarioContenedor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 52,
          decoration: BoxDecoration(
            color: colorContenedorBlanco,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
          ),
          child: TextField(
            controller: _logica.passwordController,
            obscureText: _logica.ocultarPassword,
            style: const TextStyle(fontSize: 14, color: colorTextoPrincipal),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key_outlined, color: colorPrimario, size: 22),
              suffixIcon: IconButton(
                icon: Icon(
                  _logica.ocultarPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: colorTextoAtenuado,
                  size: 22,
                ),
                onPressed: _logica.alternarOcultarPassword,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  // 6. Checkbox "Recordar este dispositivo"
  Widget _construirOpcionRecordar() {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _logica.recordarDispositivo,
            activeColor: colorPrimarioContenedor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onChanged: _logica.alternarRecordarDispositivo,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _logica.alternarRecordarDispositivo(!_logica.recordarDispositivo),
          child: const Text(
            'Recordar este dispositivo',
            style: TextStyle(fontSize: 13, color: colorTextoSecundario),
          ),
        ),
      ],
    );
  }

  // 7. Botón Principal "Entrar ->"
  Widget _construirBotonEntrar() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _logica.estaCargando ? null : () => _logica.procesarLogin(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimarioContenedor,
          elevation: 4,
          shadowColor: colorPrimarioContenedor.withOpacity(0.35),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
                    'Entrar',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ],
              ),
      ),
    );
  }

  // 8. Enlace "¿No tienes cuenta? Crear cuenta"
  Widget _construirSeccionCrearCuenta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta? ',
          style: TextStyle(fontSize: 13.5, color: colorTextoSecundario),
        ),
        GestureDetector(
          onTap: () => _logica.irARegistro(context),
          child: const Text(
            'Crear cuenta',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: colorPrimarioContenedor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  // 9. Banner de Estudiantes Conectados
  Widget _construirBannerEstudiantesConectados() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorContenedorBajo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 28,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: _construirAvatarIniciales('JD', const Color(0xFF6B21A8)),
                ),
                Positioned(
                  left: 16,
                  child: _construirAvatarIniciales('AL', const Color(0xFF006C49)),
                ),
                Positioned(
                  left: 32,
                  child: _construirAvatarIniciales('MR', const Color(0xFFF97316)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '+200 Estudiantes',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
              ),
              Text(
                'Conectados en tiempo real',
                style: TextStyle(fontSize: 11, color: colorTextoSecundario),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _construirAvatarIniciales(String texto, Color color) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 10. Pie Institucional
  Widget _construirPieInstitucional() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shield_outlined, size: 16, color: colorPrimarioContenedor),
            SizedBox(width: 6),
            Text(
              'Universidad Politécnica de Victoria',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colorTextoAtenuado,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Acceso cifrado y exclusivo para la comunidad universitaria UPV. Sujeto a las políticas de privacidad y uso de tecnologías institucionales.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: colorTextoAtenuado,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}