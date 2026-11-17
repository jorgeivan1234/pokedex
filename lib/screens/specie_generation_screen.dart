import 'package:flutter/material.dart';
import 'package:pokedex/shared/infraestructure/service/services.dart';
import 'package:pokedex/shared/widget/card_pokemon.dart';

class SpecieGenerationScreen extends StatefulWidget {

  final String name;
  final int generation;

  const SpecieGenerationScreen({
    super.key, 
    required this.generation, 
    required this.name
  });

  @override
  State<SpecieGenerationScreen> createState() => _SpecieGenerationScreenState();
}

class _SpecieGenerationScreenState extends State<SpecieGenerationScreen> {


  late Future<List<Map<String, dynamic>>> _speciesFuture;

  @override
  void initState() {
    super.initState();
    _loadSpecies();
  }

  void _loadSpecies() {
    _speciesFuture = obtenerPokemonPorGeneraciones(widget.generation);
  }

  void _retryLoading() {
    setState(_loadSpecies);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Species - Generation ${widget.name}'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/unova.gif',
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _speciesFuture, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Error al cargar las espceies:\n${snapshot.error}'),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: _retryLoading, 
                        child: const Text('Intentar de nuevo'),
                      ),
                    ],
                  ),
                );
              }

              final especies = snapshot.data ?? [];

              if (especies.isEmpty){
                return Center(
                  child: Text('No se encontraron especies para esta generacion.'),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: especies.length,
                itemBuilder: ( context,  index) {
                  final elemento = especies[index];

                  return CardPokemon(
                    pokemon: elemento['pokemon'] as Map<String, dynamic>, 
                    pokemonSpecies: elemento ['species'] as Map<String, dynamic>
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}