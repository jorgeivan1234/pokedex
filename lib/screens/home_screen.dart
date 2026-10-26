import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/service/poke_species_api_service.dart';
import 'package:pokedex/widget/widget.dart';

import '../service/poke_api_service.dart';

class HomeScreen extends StatefulWidget {

  // final int pageIndex; 

  const HomeScreen({
    super.key, 
    // required this.pageIndex
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //guardara lista de cantidades de pokemon mas grandes
  late Future<List<Map<String, dynamic>>> _pokemonFuture;
  late Future<List<Map<String, dynamic>>> _pokemonSpeciesFuture;


  String? _selectedType;

  //aqui guardaremos en pokemonFuture los pokemon obtenidos de la api
  void _retryLoadingPokemon(){
    setState(() {
      _pokemonFuture = obtenerPokemon();
    });
  }

  void _retryLoadingPokemonSpecies(){
    setState(() {
      _pokemonSpeciesFuture = obtenerPokemonSpecies();
    });
  }

  @override
  void initState() {
    super.initState();
      _pokemonFuture = obtenerPokemon();
      _pokemonSpeciesFuture = obtenerPokemonSpecies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        //titulo de el app bar
        // title: const Row(
        //   children: [
        //     ImageIcon(
        //       AssetImage('assets/icon/logo.png'),
        //       size: 24,
        //       color: Colors.blue,
        //     ),
        //     SizedBox(height: 10),
            // Text('Pokedex'),
        //   ],        
        // ),
        
        //titulo de el app bar
        title: const Text('Pokedex'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.red,
        //color de letra e icono
        foregroundColor: Colors.black,
        //centra el titulo
        centerTitle: true,
      ),
      //llamada al draweScreen
      drawer: const DrawerScreen(),

      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
      //agrega un cuerpo
      body: Center(
        //trae toda la informacion de la api almacenada en obtenerPokemon
        child: FutureBuilder<List<Map<String, dynamic>>> (
          future: _pokemonFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator()
              );
            }

            //en caso de que no pueda cargar la informacion
            if (snapshot.hasError ) {
              return Center(
                child: Column(
                  children: [
                    Text('${snapshot.error}'),
                    TextButton(
                      onPressed: _retryLoadingPokemon, 
                      child: Text('intentar de nuevo')
                    ),
                  ],
                ),
              );
            }

            SizedBox(height: 50);
            
            final pokemon = snapshot.data!;

            final filtrados = pokemon.where ((p){
              if (_selectedType == null) return true;
              return p['types'].any (
                (item) => item['type']['name'] == _selectedType,
              );
            }).toList();

            return FutureBuilder<List<Map<String, dynamic>>>(
              future: _pokemonSpeciesFuture,
              builder: (context, speciesSnapshot) {
                if (speciesSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (speciesSnapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${speciesSnapshot.error}'),
                        TextButton(
                          onPressed: _retryLoadingPokemonSpecies,
                          child: const Text('intentar de nuevo'),
                        ),
                      ],
                    ),
                  );
                }

                final speciesByName = {
                  for (final species in speciesSnapshot.data!)
                    species['name']: species,
                };
            
                // acomoda la columna para poder traer la informacion recolectada de PokemonFiltres
                return Column(
                  children: [
                    PokemonFiltres(
                      selectedTypes: _selectedType, 
                      onTyeChanged: (value){
                        setState(() => _selectedType = value);
                      }, 
                      selectGeneration: null, 
                      onGenetarionChanged: (int? value) {},
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        childAspectRatio: 0.7,
                      ), 
                        itemCount: filtrados.length,
                        itemBuilder: (context, index) {
                        final pokemon = filtrados[index];
                        final species = speciesByName[pokemon['species']['name']];
                          return CardPokemon(
                            pokemon: pokemon,
                            pokemonSpecies: species ?? {},
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
        )
      )
    );
  }
}