import 'package:flutter/material.dart';


import 'INTRO/intro_diseno.dart';
import 'REGISTRO/registro_paso_1_diseno.dart';
import 'REGISTRO/registro_paso_2_diseno.dart';
import 'REGISTRO/registro_paso_3_diseno.dart';
import 'RESUMEN/resumen_registro_diseno.dart';
import 'BIENVENIDA/bienvenida_diseno.dart';
import 'LOGIN/login_diseno.dart';
import 'SWIPE/swipe_inicio_diseno.dart';
import 'SWIPE/swipe_info_diseno.dart';
import 'EXPLORAR/explorar_inicio_diseno.dart';
import 'CHATS/chats_inicio_diseno.dart';

void main() {
  runApp(const ConectaUpvApp());
}

class ConectaUpvApp extends StatelessWidget {
  const ConectaUpvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conecta UPV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFCF8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF630ED4),
        ),
        useMaterial3: true,
      ),
      
      // 1. Define la ruta con la que arranca la aplicación
      initialRoute: '/',

      // 2. Se registran las rutas asociadas a las pantallas de diseño


  routes: {
    '/': (context) => const IntroduccionDiseno(),
    '/registro': (context) => const RegistroPaso1Diseno(),
    '/registro_paso_2': (context) => const RegistroPaso2Diseno(),
    '/registro_paso_3': (context) => const RegistroPaso3Diseno(),
    '/resumen': (context) => const ResumenDiseno(),
    '/bienvenida': (context) => const BienvenidaRegistroDiseno(),
    '/login': (context) => const LoginDiseno(),
    
    // Rutas para el Swipe 
    '/swipe': (context) => const SwipeDiseno(),
    '/swipe_inicio': (context) => const SwipeDiseno(),
    '/swipe_info': (context) => const SwipeInfoDiseno(),
    
    // Rutas para Explorar
    '/explorar': (context) => const ExplorarDiseno(),
    '/explorar_inicio': (context) => const ExplorarDiseno(),


    '/chats_inicio':(context) => const ChatsInicioDiseno(),

  },    );
  }
}