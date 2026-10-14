import 'package:flutter/material.dart';

import 'config/router/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //navegacion del router
    return MaterialApp.router(
      //quitaa la bandera de prueba
      debugShowCheckedModeBanner: false,
      title: 'api pokemon',
      //utiliza go route para cambiar entre pantallas
      routerConfig: appRouter,
    );
  }
}
