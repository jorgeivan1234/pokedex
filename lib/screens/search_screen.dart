import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/infraestructure/service/poke_api_service.dart';
import 'package:pokedex/shared/infraestructure/service/poke_species_api_service.dart';
import '../shared/widget/widget.dart';

class SearchScreen extends StatefulWidget {
  
  const SearchScreen({
    super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late Future<List<Map<String, dynamic>>> _pokemonFuture;
  late Future<List<Map<String, dynamic>>> _specieFuture;
  final _searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _pokemonFuture = obtenerPokemon();
    _specieFuture = obtenerPokemonSpecies();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Buscar Pokemon'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/pikachu_vulpix.gif',
              fit: BoxFit.cover,
            ),    
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Buscar Pokemon',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _pokemonFuture, 
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError){
                          return Center(
                            child: Text('Error: ${snapshot.error}.'),
                          );
                        }

                        final pokemon = snapshot.data ?? [];

                        final query = _searchController.text.trim().toLowerCase();
                        final resultados = pokemon.where((p) {
                          final nombre = p['name'].toString().toLowerCase();
                          final numero = p['id'].toString();
                          return nombre.contains(query) || numero.contains(query);
                        }).toList();

                        return FutureBuilder(
                          future: _specieFuture, 
                          builder: (context, specieSnapshot) {
                            if (specieSnapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (specieSnapshot.hasError){
                              return Center(
                                child: Text('Error: ${specieSnapshot.error}.'),
                              );
                            }
                            final specieByName = {
                              for(final specie in specieSnapshot.data ?? [])
                              specie['name']: specie
                            };

                            if (resultados.isEmpty){
                              return const Center( 
                                child: Text ('No se encontraron Pokemon.')
                              );
                            }

                            return GridView.builder(
                              itemCount: resultados.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, 
                                childAspectRatio: 0.7
                              ),
                              itemBuilder: (context, index) {
                                final pokemon = resultados[index];
                                final nombreSpecie = pokemon['species']['name'];
                                final especie = specieByName[nombreSpecie];

                                if (especie == null){
                                  return const Center(
                                    child: Text('No se encontro la especie del Pokemon.')
                                  );
                                }
                                return CardPokemon(
                                  pokemon: pokemon,
                                  pokemonSpecies: especie,
                                );
                              }
                            );
                          }
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/home'), 
      ),      
      //trae el drawer a details
      drawer: const DrawerScreen(),

      //trae el widget de busqueda
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
    );
  }
}