import 'package:flutter/material.dart';
import 'package:pokedex/config/theme_settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/router/go_router.dart';


const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const publishableKey = String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();

  if (supabaseUrl.isEmpty || publishableKey.isEmpty){
    throw StateError('Faltan SUPABASE_URL o SUPABASE_PUBLISHABLE_KEY');
  }

  await Supabase.initialize(
    url: supabaseUrl,
    publishableKey: publishableKey
  );

  await ThemeSettings.load();
  
    runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //navegacion del router
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeSettings.darkMode,
      builder: (context, modeDark, _) {
        return MaterialApp.router(
          //quitaa la bandera de prueba
          debugShowCheckedModeBanner: false,
          title: 'api pokemon',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: modeDark,
          //utiliza go route para cambiar entre pantallas
          routerConfig: appRouter,
        );
      }
    );
  }
}
