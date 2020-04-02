import 'package:flutter/material.dart';

import 'package:ut_app/src/pages/calificaciones_page.dart';
import 'package:ut_app/src/pages/convocatorias_page.dart';
import 'package:ut_app/src/pages/home_page.dart';
import 'package:ut_app/src/pages/login_page.dart';
import 'package:ut_app/src/pages/notificaciones_page.dart';
import 'package:ut_app/src/pages/perfil_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App UTVCO',
      initialRoute: '/',
      routes: {
        '/'              : (BuildContext context) => LoginPage(),
        'home'           : (BuildContext context) => HomePage(),
        'notificaciones' : (BuildContext context) => NotificacionesPage(),
        'calificaciones' : (BuildContext context) => CalificacionesPage(),
        'convocatorias'  : (BuildContext context) => ConvocatoriasPage(),
        'perfil'         : (BuildContext context) => PerfilPage(),
      },
      theme: ThemeData(
          primaryColor: Color(0xff032B2E)
        ),
    );
  }
}