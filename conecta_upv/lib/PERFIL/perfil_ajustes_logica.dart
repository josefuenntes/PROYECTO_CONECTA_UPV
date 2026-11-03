import 'package:flutter/material.dart';

class InteresItem {
  final String nombre;
  final IconData icono;
  bool seleccionado;

  InteresItem({
    required this.nombre,
    required this.icono,
    this.seleccionado = false,
  });
}

class PerfilAjustesLogica extends ChangeNotifier {
  // Datos estáticos predefinidos
  String numeroCelular = '+52 834 123 4567';
  final String correoInstitucional = 'mateo.morales@upv.edu.mx';
  final String carrera = 'Ingeniería en Tecnologías de la Información (ITI)';
  final String detalleCarrera = 'Campus Victoria • 8vo Cuatrimestre';

  // Lista estática de intereses
  final List<InteresItem> intereses = [
    InteresItem(nombre: 'Programación', icono: Icons.code, seleccionado: true),
    InteresItem(nombre: 'Inteligencia Artificial', icono: Icons.psychology, seleccionado: true),
    InteresItem(nombre: 'Desarrollo Móvil', icono: Icons.smartphone, seleccionado: true),
    InteresItem(nombre: 'Cálculo y Matemáticas', icono: Icons.functions, seleccionado: false),
    InteresItem(nombre: 'Bases de Datos', icono: Icons.storage, seleccionado: true),
    InteresItem(nombre: 'Ciberseguridad', icono: Icons.security, seleccionado: false),
    InteresItem(nombre: 'Robótica UPV', icono: Icons.precision_manufacturing, seleccionado: false),
    InteresItem(nombre: 'Ajedrez', icono: Icons.sports_esports, seleccionado: false),
  ];

  // 🔹 Alternar selección de chip
  void toggleInteres(int index) {
    intereses[index].seleccionado = !intereses[index].seleccionado;
    notifyListeners();
  }

  // 🔹 Agregar interés estático
  void agregarNuevoInteres(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Agregar Interés'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Ej. Robótica, UI/UX...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                intereses.add(
                  InteresItem(
                    nombre: controller.text.trim(),
                    icono: Icons.label,
                    seleccionado: true,
                  ),
                );
                notifyListeners();
              }
              Navigator.pop(ctx);
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  // 🔹 Diálogo para editar número de celular
  void editarCelular(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: numeroCelular);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Editar Número Celular'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(hintText: '+52 834 ...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                numeroCelular = controller.text.trim();
                notifyListeners();
              }
              Navigator.pop(ctx);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  // 🔹 Reportar un problema
void reportarProblema(BuildContext context) {
  Navigator.pushNamed(context, '/perfil_reportar'); // 👈 Abre la pantalla de Reportar Problema
}
  // 🔹 Cerrar sesión
  void cerrarSesion(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  // 🔹 Borrar cuenta
  void borrarCuenta(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  // 🔹 Regresar a la pantalla anterior
  void regresar(BuildContext context) {
    Navigator.pop(context);
  }
}