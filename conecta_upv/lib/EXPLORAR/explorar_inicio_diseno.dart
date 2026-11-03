import 'package:flutter/material.dart';
import 'explorar_inicio_logica.dart';

class ExplorarDiseno extends StatefulWidget {
  const ExplorarDiseno({super.key});

  @override
  State<ExplorarDiseno> createState() => _ExplorarDisenoState();
}

class _ExplorarDisenoState extends State<ExplorarDiseno> {
  late final ExplorarLogica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorFondoTarjeta = Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    _logica = ExplorarLogica();
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
                  _construirEncabezadoSeccion(),
                  const SizedBox(height: 20),
                  _construirGridCategorias(),
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
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: colorPrimario,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.hub, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          RichText(
            text: const TextSpan(
              text: 'Conecta',
              style: TextStyle(
                color: colorTextoPrincipal,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: 'UPV',
                  style: TextStyle(color: colorPrimario, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirEncabezadoSeccion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'APRENDE Y CONECTA',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: colorPrimario,
            letterSpacing: 0.8,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Explorar',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colorTextoPrincipal,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Encuentra personas que dominan lo que quieres aprender.',
          style: TextStyle(
            fontSize: 13.5,
            color: colorTextoSecundario,
          ),
        ),
      ],
    );
  }

  Widget _construirGridCategorias() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _logica.categorias.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        final cat = _logica.categorias[index];
        return _construirTarjetaCategoria(cat);
      },
    );
  }

  Widget _construirTarjetaCategoria(CategoriaExplorar categoria) {
    return InkWell(
      onTap: () => _logica.seleccionarCategoria(context, categoria),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorFondoTarjeta,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icono superior izquierdo con contenedor suavizado
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: categoria.colorFondo,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                categoria.icono,
                size: 24,
                color: categoria.colorIcono,
              ),
            ),
            // Titulo inferior y flecha
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoria.titulo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorTextoPrincipal,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 6),
                Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: categoria.colorIcono,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirNavegacionInferior() {
    return BottomNavigationBar(
      currentIndex: _logica.tabSeleccionada,
      onTap: (index) => _logica.cambiarTab(context, index),
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