import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/screens/screens.dart';

final appRouter = GoRouter(
  //pantalla inicial
  initialLocation: '/home',

  //ruutas de pantallas
  routes: [
    GoRoute(
      //ruta de home
      path: '/home', 
      builder: (context, state) => const HomeScreen()
    ),

    //ruta de busqueda
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),

    GoRoute(
      //trae los diferentes pokemon para cada details sin que  
      path: '/details',
      builder: (context, state) {
        final pokemon = state.extra;
        //si el pokemon es el mapa con el string dymanic, regresar los detalles con lo que apunta a pokemon
          if ( pokemon is Map<String, dynamic> ){
            return DetailsScreen(pokemon: pokemon);
          }

        //en caso de que no exista el pokemon o no este disponible
        return const Scaffold(
          body: Center(
            child: Text('No se recibieron los datos del Pokémon')
          ),
        );
      },
    ),
    
    GoRoute(
      path: '/generation',
      builder: (context, state) => const GenerationScreen(),
    )
  ],
);
