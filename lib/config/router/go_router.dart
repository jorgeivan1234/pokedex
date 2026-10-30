import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/screens/screens.dart';

final appRouter = GoRouter(
  //pantalla inicial
  initialLocation: '/register',
  //ruutas de pantallas
  routes: [
    GoRoute(
      //ruta de home
      path: '/home', 
      // path: '/home/:page', 
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
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
        final extra = state.extra;
        //si el pokemon es el mapa con el string dymanic, regresar los detalles con lo que apunta a pokemon
          if (extra is Map<String, dynamic> &&
              extra['pokemon'] is Map<String, dynamic> &&
              extra['pokemonSpecies'] is Map<String, dynamic>) {
            return DetailsScreen(
                pokemon: extra['pokemon'] as Map<String, dynamic>,
                pokemonSpecies: extra['pokemonSpecies'] as Map<String, dynamic>,
              );
          }

        //en caso de que no exista el pokemon o no este disponible
        return Scaffold(
          body: const Center(
            child: Text('No se recibieron los datos del Pokémon')
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.go('/home'), 
          ),          
        );
      },
    ),
    
    GoRoute(
      path: '/generation',
      builder: (context, state) => const GenerationScreen(),
    ),

    GoRoute(
      path: '/region',
      builder: (context, state){
        final datos = state.extra as Map<String, dynamic>;
        return RegionScreen(
          name: datos['name'], 
          generation: datos['generation'], 
        );
      }
    ),

    GoRoute(
      //trae los diferentes pokemon para cada details sin que  
      path: '/sprites',
      builder: (context, state) {
        final pokemon = state.extra;
        //si el pokemon es el mapa con el string dymanic, regresar los detalles con lo que apunta a pokemon
          if ( pokemon is Map<String, dynamic> ){
            return SpritesScreen(pokemon: pokemon);
          }

        //en caso de que no exista el pokemon o no este disponible
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.go('/home'), 
          ),
          body: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  'assets/images/volcan.gif',
                  fit: BoxFit.cover 
                ),
              ),
              SafeArea(
                child: Center(
                  child: Text(
                    'No se recibieron los datos del Pokémon',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    )
                  )
                ),
              )
            ],
          )
        );
      },
    ),

    GoRoute(
      path: '/habilitys',
      builder: (context, state) {
        final pokemon = state.extra;
        //si el pokemon es el mapa con el string dymanic, regresar los detalles con lo que apunta a pokemon
          if ( pokemon is Map<String, dynamic> ){
            return HabilitysScreen(pokemon: pokemon);
          }

        //en caso de que no exista el pokemon o no este disponible
        return  Scaffold(
          body: const Center(
            child: Text('No se recibieron los datos del Pokémon')
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.go('/home'), 
          ),
        );
      }
    ),

    GoRoute(
      path: '/config',
      builder: (context, state) => ConfigScreen(),
    ),

    GoRoute(
      path: '/perfil',
      builder: (context, state) => PerfilScreen(),
    ),

    GoRoute(
      path: '/tutorial',
      builder: (context, state) => TutorialScreen(),
    ),
  ],
);