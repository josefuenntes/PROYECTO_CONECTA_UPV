import 'package:flutter/material.dart';
import 'perfil_reportar_logica.dart';

class PerfilReportarDiseno extends StatefulWidget {
  const PerfilReportarDiseno({super.key});

  @override
  State<PerfilReportarDiseno> createState() => _PerfilReportarDisenoState();
}

class _PerfilReportarDisenoState extends State<PerfilReportarDiseno> {
  late PerfilReportarLogica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);

  @override
  void initState() {
    super.initState();
    _logica = PerfilReportarLogica();
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
          appBar: AppBar(
            backgroundColor: colorSuperficie.withOpacity(0.9),
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: colorTextoPrincipal),
              onPressed: () => _logica.regresar(context),
            ),
            title: const Text(
              'Reportar Problema',
              style: TextStyle(
                color: colorTextoPrincipal,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: colorPrimario,
                  child: Icon(Icons.person, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Insignia Soporte Técnico
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE9FE),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.support_agent, size: 16, color: colorPrimario),
                        SizedBox(width: 6),
                        Text(
                          'SOPORTE TÉCNICO Y COMUNIDAD UPV',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                            color: colorPrimario,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Título principal
                  const Text(
                    '¿QUÉ PROBLEMA OCURRIÓ?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: colorTextoPrincipal,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Cuéntanos qué falló o qué inconveniente tuviste para que el equipo de soporte de ConectaUPV pueda solucionarlo a la brevedad.',
                    style: TextStyle(fontSize: 13, color: colorTextoSecundario, height: 1.4),
                  ),
                  const SizedBox(height: 20),

                  // Tipo de incidencia
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Tipo de incidencia',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                      ),
                      Text(
                        'Selecciona una opción',
                        style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Column(
                    children: _logica.categorias.map((cat) {
                      final esSeleccionada = cat.id == _logica.categoriaSeleccionadaId;
                      return GestureDetector(
                        onTap: () => _logica.seleccionarCategoria(cat.id),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: esSeleccionada ? colorPrimario : const Color(0xFFF6F2FF),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: esSeleccionada
                                ? const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))]
                                : [],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                cat.icono,
                                size: 20,
                                color: esSeleccionada ? Colors.white : colorPrimario,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  cat.titulo,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: esSeleccionada ? Colors.white : colorTextoPrincipal,
                                  ),
                                ),
                              ),
                              Icon(
                                esSeleccionada ? Icons.check_circle : Icons.radio_button_unchecked,
                                size: 20,
                                color: esSeleccionada ? Colors.white : const Color(0xFFCCC3D8),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Caja de Asunto
                  const Text(
                    'Asunto',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: TextField(
                      controller: _logica.controllerAsunto,
                      style: const TextStyle(fontSize: 13, color: colorTextoPrincipal),
                      decoration: const InputDecoration(
                        hintText: 'Ej. No se envían mis mensajes en el chat institucional...',
                        hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12.5),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Caja de Descripción con Contador
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Describe lo que sucedió',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                      ),
                      Text(
                        '${_logica.caracteresActuales} / ${_logica.maxCaracteres}',
                        style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _logica.controllerDescripcion,
                          maxLength: _logica.maxCaracteres,
                          maxLines: 5,
                          style: const TextStyle(fontSize: 13, color: colorTextoPrincipal, height: 1.4),
                          decoration: const InputDecoration(
                            hintText: 'Describe paso a paso lo que ocurrió, cuándo sucedió y cualquier detalle relevante para poder reproducirlo...',
                            hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12.5),
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: const [
                            Icon(Icons.info_outline, size: 14, color: colorTextoSecundario),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Sé lo más detallado posible para agilizar la respuesta.',
                                style: TextStyle(fontSize: 11, color: colorTextoSecundario),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Adjuntar evidencia (Opcional)
                  const Text(
                    'Adjuntar evidencia (Opcional)',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: _logica.simularAdjuntarFoto,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F2FF),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFCCC3D8), style: BorderStyle.solid),
                      ),
                      child: _logica.nombreArchivoAdjunto == null
                          ? Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: const Color(0xFFEDE9FE),
                                  child: const Icon(Icons.add_a_photo, color: colorPrimario, size: 20),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Subir captura de pantalla',
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Formatos PNG o JPG (máximo 5MB)',
                                  style: TextStyle(fontSize: 11, color: colorTextoSecundario),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.image, size: 18, color: colorPrimario),
                                const SizedBox(width: 8),
                                Text(
                                  _logica.nombreArchivoAdjunto!,
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: _logica.eliminarAdjunto,
                                  child: const Icon(Icons.close, size: 16, color: Colors.red),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tarjeta verde de correo de respuesta
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1FAE5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.mail, size: 16, color: Color(0xFF059669)),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Recibirás respuesta en: ${_logica.correoRespuesta}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: colorTextoPrincipal,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botón Enviar Reporte
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
                      onPressed: _logica.estaEnviando ? null : () => _logica.enviarReporte(context),
                      icon: _logica.estaEnviando
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            )
                          : const Icon(Icons.send, size: 18),
                      label: Text(
                        _logica.estaEnviando ? 'ENVIANDO...' : 'ENVIAR REPORTE',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Botón Cancelar y volver
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: TextButton(
                      onPressed: () => _logica.regresar(context),
                      child: const Text(
                        'Cancelar y volver',
                        style: TextStyle(color: colorTextoSecundario, fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Marca de agua JF11
                  const Center(
                    child: Text(
                      'JF11',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B7487),
                        letterSpacing: 2,
                      ),
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
}