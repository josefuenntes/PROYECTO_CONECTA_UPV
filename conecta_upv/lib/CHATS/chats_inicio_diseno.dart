import 'package:flutter/material.dart';
import 'chats_inicio_logica.dart';

class ChatsInicioDiseno extends StatefulWidget {
  const ChatsInicioDiseno({super.key});

  @override
  State<ChatsInicioDiseno> createState() => _ChatsInicioDisenoState();
}

class _ChatsInicioDisenoState extends State<ChatsInicioDiseno> {
  late final ChatsInicioLogica _logica;
  final TextEditingController _searchController = TextEditingController();

  // Paleta de colores oficial ConectaUPV
  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorContenedorBusqueda = Color(0xFFE5EEFF);
  static const Color colorVerdeEnLinea = Color(0xFF059669);

  @override
  void initState() {
    super.initState();
    _logica = ChatsInicioLogica();
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                  _construirEncabezadoJaguares(),
                  const SizedBox(height: 16),
                  _construirBarraBusqueda(),
                  const SizedBox(height: 20),
                  _construirSeccionNuevosMatches(),
                  const SizedBox(height: 24),
                  _construirSeccionConversaciones(),
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
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: colorPrimario,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.hub, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Conecta',
                  style: TextStyle(
                    color: colorTextoPrincipal,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: 'UPV',
                      style: TextStyle(color: colorPrimario, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Text(
                'Chats',
                style: TextStyle(color: colorTextoSecundario, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _construirEncabezadoJaguares() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.pets, color: colorPrimario, size: 26),
                SizedBox(width: 8),
                Text(
                  'JAGUARES CONECTADOS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: colorTextoPrincipal,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_note, color: colorPrimario, size: 26),
              tooltip: 'Nuevo mensaje',
            ),
          ],
        ),
        const SizedBox(height: 2),
        const Text(
          'Compañeros de campus en sintonía académica y proyectos activos',
          style: TextStyle(color: colorTextoSecundario, fontSize: 13),
        ),
      ],
    );
  }

  Widget _construirBarraBusqueda() {
    return Container(
      decoration: BoxDecoration(
        color: colorContenedorBusqueda.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        controller: _searchController,
        onChanged: _logica.actualizarBusqueda,
        style: const TextStyle(color: colorTextoPrincipal, fontSize: 14),
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: colorTextoSecundario, size: 22),
          hintText: 'Buscar en tus chats...',
          hintStyle: const TextStyle(color: colorTextoSecundario, fontSize: 14),
          border: InputBorder.none,
          suffixIcon: _logica.filtroBusqueda.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.cancel, color: colorTextoSecundario, size: 18),
                  onPressed: () {
                    _searchController.clear();
                    _logica.limpiarBusqueda();
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _construirSeccionNuevosMatches() {
    final matches = _logica.nuevosMatchesFiltrados;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'NUEVOS MATCHES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colorTextoPrincipal,
                letterSpacing: 0.8,
              ),
            ),
            SizedBox(width: 6),
            CircleAvatar(radius: 4, backgroundColor: colorPrimario),
          ],
        ),
        const SizedBox(height: 12),
        if (matches.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'No hay nuevos matches aún',
              style: TextStyle(color: colorTextoSecundario, fontSize: 13, fontStyle: FontStyle.italic),
            ),
          )
        else
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final match = matches[index];
                return GestureDetector(
                  onTap: () => _logica.abrirChat(context, match),
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: colorPrimario, width: 2),
                              ),
                              child: CircleAvatar(
                                radius: 26,
                                backgroundImage: NetworkImage(match.imagenUrl),
                              ),
                            ),
                            if (match.estaEnLinea)
                              Positioned(
                                bottom: 2,
                                right: 2,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: colorVerdeEnLinea,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          match.nombre,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: colorTextoPrincipal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _construirSeccionConversaciones() {
    final conversaciones = _logica.conversacionesFiltradas;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'CONVERSACIONES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colorTextoPrincipal,
                letterSpacing: 0.8,
              ),
            ),
            Row(
              children: const [
                Icon(Icons.tune, size: 16, color: colorPrimario),
                SizedBox(width: 4),
                Text(
                  'Recientes',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorPrimario),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
if (conversaciones.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Center(
              child: Text(
                'No tienes conversaciones activas',
                style: TextStyle(color: colorTextoSecundario, fontSize: 13),
              ),
            ),
          )        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: conversaciones.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final chat = conversaciones[index];
              return InkWell(
                onTap: () => _logica.abrirChat(context, chat),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(chat.imagenUrl),
                          ),
                          if (chat.estaEnLinea)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: colorVerdeEnLinea,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  chat.nombre,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: colorTextoPrincipal,
                                  ),
                                ),
                                Text(
                                  chat.hora,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: chat.mensajesNoLeidos > 0 ? colorPrimario : colorTextoSecundario,
                                    fontWeight: chat.mensajesNoLeidos > 0 ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    chat.ultimoMensaje,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: chat.mensajesNoLeidos > 0 ? colorTextoPrincipal : colorTextoSecundario,
                                      fontWeight: chat.mensajesNoLeidos > 0 ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (chat.mensajesNoLeidos > 0)
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: colorPrimario,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${chat.mensajesNoLeidos}',
                                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
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
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
      ],
    );
  }
}