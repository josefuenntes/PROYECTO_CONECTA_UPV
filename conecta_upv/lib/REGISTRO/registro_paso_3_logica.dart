import 'package:flutter/material.dart';

class RegistroPaso3Logica extends ChangeNotifier {
  // Controladores para agregar habilidades o intereses personalizados
  final TextEditingController customEnsenarController = TextEditingController();
  final TextEditingController customAprenderController = TextEditingController();

  // Opciones disponibles para ensenar
  final List<String> habilidadesEnsenarDisponibles = [
    'Programacion',
    'Bases de datos',
    'Diseno UX/UI',
    'Calculo',
    'Redes',
    'Exposiciones',
    'Trabajo en equipo',
  ];

  // Opciones disponibles para aprender
  final List<String> interesesAprenderDisponibles = [
    'Bases de datos',
    'Redes',
    'Ingles',
    'Cloud/DevOps',
    'Calculo Avanzado',
  ];

  // Elementos seleccionados por el usuario
  final Set<String> _puedoEnsenarSeleccionados = {
    'Programacion',
    'Diseno UX/UI',
    'Exposiciones',
    'Trabajo en equipo',
  };

  final Set<String> _deseoAprenderSeleccionados = {
    'Ingles',
    'Cloud/DevOps',
  };

  bool _estaCargando = false;

  // Getters para consultar estado
  Set<String> get puedoEnsenarSeleccionados => _puedoEnsenarSeleccionados;
  Set<String> get deseoAprenderSeleccionados => _deseoAprenderSeleccionados;
  bool get estaCargando => _estaCargando;

  // Metodos de seleccion/deseleccion
  void alternarHabilidadEnsenar(String habilidad) {
    if (_puedoEnsenarSeleccionados.contains(habilidad)) {
      _puedoEnsenarSeleccionados.remove(habilidad);
    } else {
      _puedoEnsenarSeleccionados.add(habilidad);
    }
    notifyListeners();
  }

  // Metodo para regresar a la pantalla anterior en la pila
  void regresar(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void alternarInteresAprender(String interes) {
    if (_deseoAprenderSeleccionados.contains(interes)) {
      _deseoAprenderSeleccionados.remove(interes);
    } else {
      _deseoAprenderSeleccionados.add(interes);
    }
    notifyListeners();
  }

  // Metodos para eliminar elementos (tachita)
  void eliminarHabilidadEnsenar(String habilidad) {
    habilidadesEnsenarDisponibles.remove(habilidad);
    _puedoEnsenarSeleccionados.remove(habilidad);
    notifyListeners();
  }

  void eliminarInteresAprender(String interes) {
    interesesAprenderDisponibles.remove(interes);
    _deseoAprenderSeleccionados.remove(interes);
    notifyListeners();
  }

  // Metodos para agregar items personalizados
  void agregarHabilidadPersonalizada() {
    final texto = customEnsenarController.text.trim();
    if (texto.isNotEmpty) {
      if (!habilidadesEnsenarDisponibles.contains(texto)) {
        habilidadesEnsenarDisponibles.add(texto);
      }
      _puedoEnsenarSeleccionados.add(texto);
      customEnsenarController.clear();
      notifyListeners();
    }
  }

  void agregarInteresPersonalizado() {
    final texto = customAprenderController.text.trim();
    if (texto.isNotEmpty) {
      if (!interesesAprenderDisponibles.contains(texto)) {
        interesesAprenderDisponibles.add(texto);
      }
      _deseoAprenderSeleccionados.add(texto);
      customAprenderController.clear();
      notifyListeners();
    }
  }

  // Finalizar el proceso de registro
// Finalizar el proceso de registro y enviar mapa completo
  Future<void> procesarFinalizarPerfil(BuildContext context, Map<String, dynamic>? datosAnteriores) async {
    if (_puedoEnsenarSeleccionados.isEmpty && _deseoAprenderSeleccionados.isEmpty) {
      _mostrarMensaje(context, 'Selecciona al menos una habilidad o interes', esError: true);
      return;
    }

    _estaCargando = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1000));

    _estaCargando = false;
    notifyListeners();

    if (!context.mounted) return;

    // 📦 Mapa con la informacion real e integral de todo el flujo
    final Map<String, dynamic> datosCompletos = {
      ...?datosAnteriores,
      'puedoEnsenar': _puedoEnsenarSeleccionados.toList(),
      'deseoAprender': _deseoAprenderSeleccionados.toList(),
    };

    // 🚀 Navegar al Resumen entregando todos los datos
    Navigator.pushNamed(context, '/resumen', arguments: datosCompletos);
  }
  void _mostrarMensaje(BuildContext context, String mensaje, {bool esError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: esError ? const Color(0xFFBA1A1A) : const Color(0xFF059669),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    customEnsenarController.dispose();
    customAprenderController.dispose();
    super.dispose();
  }
}