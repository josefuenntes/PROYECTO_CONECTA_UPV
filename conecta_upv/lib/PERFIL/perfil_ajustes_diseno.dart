import 'package:flutter/material.dart';
import 'perfil_ajustes_logica.dart';

class PerfilAjustesDiseno extends StatefulWidget {
  const PerfilAjustesDiseno({super.key});

  @override
  State<PerfilAjustesDiseno> createState() => _PerfilAjustesDisenoState();
}

class _PerfilAjustesDisenoState extends State<PerfilAjustesDiseno> {
  late PerfilAjustesLogica _logica;

  static const Color colorSuperficie = Color(0xFFFCF8FF);
  static const Color colorPrimario = Color(0xFF7C3AED);
  static const Color colorTextoPrincipal = Color(0xFF181445);
  static const Color colorTextoSecundario = Color(0xFF4B5563);
  static const Color colorVerdeExito = Color(0xFF059669);
  static const Color colorChipInactivo = Color(0xFFEFEBFF);

  @override
  void initState() {
    super.initState();
    _logica = PerfilAjustesLogica();
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
              'Configuración',
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
                  // Insignia Cuenta Jaguar
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEADDFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.settings, size: 16, color: colorPrimario),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'CUENTA JAGUAR',
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
                    'AJUSTES DE PERFIL',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: colorTextoPrincipal,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Administra tu información personal, preferencias de cuenta y seguridad en ConectaUPV.',
                    style: TextStyle(fontSize: 13, color: colorTextoSecundario, height: 1.4),
                  ),
                  const SizedBox(height: 20),

                  // Header Datos Registrados
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Datos registrados',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                      ),
                      Row(
                        children: [
                          Icon(Icons.verified, size: 14, color: colorVerdeExito),
                          SizedBox(width: 4),
                          Text(
                            'Credencial activa',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorVerdeExito),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // 1. Tarjeta Celular Registrado
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F2FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.phone_iphone, color: colorPrimario, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Número celular registrado', style: TextStyle(fontSize: 11, color: colorTextoSecundario)),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    _logica.numeroCelular,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFECFDF5),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: const Color(0xFFA7F3D0)),
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.check_circle, size: 11, color: colorVerdeExito),
                                        SizedBox(width: 3),
                                        Text('Verificado', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colorVerdeExito)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, size: 18, color: colorPrimario),
                          onPressed: () => _logica.editarCelular(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 2. Tarjeta Correo Institucional
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F2FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.mail_outline, color: colorPrimario, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Correo institucional registrado', style: TextStyle(fontSize: 11, color: colorTextoSecundario)),
                              const SizedBox(height: 2),
                              Text(
                                _logica.correoInstitucional,
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: const [
                                  Icon(Icons.lock, size: 12, color: colorTextoSecundario),
                                  SizedBox(width: 4),
                                  Text('Gestionado por dominio UPV', style: TextStyle(fontSize: 11, color: colorTextoSecundario)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.lock_clock, size: 20, color: Color(0xFF7B7487)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 3. Tarjeta Carrera Registrada
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F2FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.school, color: colorPrimario, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Carrera registrada', style: TextStyle(fontSize: 11, color: colorTextoSecundario)),
                              const SizedBox(height: 2),
                              Text(
                                _logica.carrera,
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: colorTextoPrincipal),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE3DFFF),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  _logica.detalleCarrera,
                                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: colorTextoPrincipal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sección Intereses a elegir
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Intereses a elegir', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: colorTextoPrincipal)),
                                Text('Personaliza tu feed, grupos y sugerencias de mentoría UPV.', style: TextStyle(fontSize: 11, color: colorTextoSecundario)),
                              ],
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEADDFF),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(Icons.interests, size: 18, color: colorPrimario),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            ...List.generate(_logica.intereses.length, (index) {
                              final item = _logica.intereses[index];
                              return _construirChipInteres(
                                item: item,
                                onTap: () => _logica.toggleInteres(index),
                              );
                            }),
                            GestureDetector(
                              onTap: () => _logica.agregarNuevoInteres(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: colorChipInactivo,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.add, size: 16, color: colorPrimario),
                                    SizedBox(width: 4),
                                    Text('Agregar interés', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorPrimario)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botón Reportar Problema
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorChipInactivo,
                        foregroundColor: colorTextoPrincipal,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () => _logica.reportarProblema(context),
                      icon: const Icon(Icons.support_agent, color: Colors.amber, size: 20),
                      label: const Text('REPORTAR ALGÚN PROBLEMA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5)),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Botón Cerrar Sesión
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
                      onPressed: () => _logica.cerrarSesion(context),
                      icon: const Icon(Icons.logout, size: 20),
                      label: const Text('CERRAR SESIÓN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.8)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Enlace Borrar cuenta
                  Center(
                    child: TextButton.icon(
                      onPressed: () => _logica.borrarCuenta(context),
                      icon: const Icon(Icons.delete_forever, size: 16, color: Color(0xFFBA1A1A)),
                      label: const Text(
                        'Borrar cuenta',
                        style: TextStyle(color: Color(0xFFBA1A1A), fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

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

  Widget _construirChipInteres({
    required InteresItem item,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: item.seleccionado ? colorPrimario : colorChipInactivo,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icono, size: 16, color: item.seleccionado ? Colors.white : colorTextoSecundario),
            const SizedBox(width: 6),
            Text(
              item.nombre,
              style: TextStyle(
                fontSize: 12,
                fontWeight: item.seleccionado ? FontWeight.bold : FontWeight.w500,
                color: item.seleccionado ? Colors.white : colorTextoSecundario,
              ),
            ),
          ],
        ),
      ),
    );
  }
}