import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:ut_app/src/models/alumno_model.dart';
import 'package:ut_app/src/models/login_model.dart';

import 'package:ut_app/src/pages/calificaciones_page.dart';
import 'package:ut_app/src/pages/convocatorias_page.dart';
import 'package:ut_app/src/pages/home_page.dart';
import 'package:ut_app/src/pages/login_page.dart';
import 'package:ut_app/src/pages/notificaciones_page.dart';
import 'package:ut_app/src/pages/perfil_page.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new LoginModel()),
        ChangeNotifierProvider(create: (_) => new AlumnoModel())
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      title: 'App UTVCO',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'notificaciones': (BuildContext context) => NotificacionesPage(),
        'calificaciones': (BuildContext context) => CalificacionesPage(),
        'convocatorias': (BuildContext context) => ConvocatoriasPage(),
        'perfil': (BuildContext context) => PerfilPage(),
      },
      theme: ThemeData(primaryColor: Color(0xff032B2E)),
    );
  }
}
