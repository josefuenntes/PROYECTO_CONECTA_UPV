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
import 'CHATS/chats_conecta2_diseno.dart';
import 'CHATS/chats_seguridad_diseno.dart';
import 'PERFIL/perfil_inicio_diseno.dart';
import 'PERFIL/perfil_sobremi_diseno.dart';
import 'PERFIL/perfil_aprender_diseno.dart';
import 'PERFIL/perfil_ensenar_diseno.dart';
import 'PERFIL/perfil_ajustes_diseno.dart';
import 'PERFIL/perfil_reportar_diseno.dart';

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


    // Rutas para Chats
    '/chats': (context) => const ChatsInicioDiseno(),     
    '/chats_inicio': (context) => const ChatsInicioDiseno(),
    '/chats_conecta2': (context) => const ChatsConecta2Diseno(),
    '/chats_seguridad': (context) => const ChatsSeguridadDiseno(),



    //rutas para perfil

    '/perfil':(context) => const PerfilDiseno(),
    '/perfil_inicio': (context) => const PerfilDiseno(),
    '/perfil_sobremi': (context) => const PerfilSobreMiDiseno(),
    '/perfil_aprender': (context) => const PerfilAprenderDiseno(),
    '/perfil_ensenar':(context) => const PerfilEnsenarDiseno(),
    '/perfil_ajustes':(context) => const PerfilAjustesDiseno(),
    '/perfil_reportar': (context) => const PerfilReportarDiseno(),

  },    );
  }
}