import 'package:flutter/material.dart';
import 'package:pokedex/shared/infraestructure/service/services.dart';

class EvolutionSelected extends StatelessWidget {

  final String url;

  const EvolutionSelected({
    super.key, 
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: obtenerEvolucion(url),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }
          
        if (snapshot.hasError){
          return const Text('No se puedieron cargar las evoluciones.');
        }

        final chain = snapshot.data!['chain'] as Map<String, dynamic>;
        return _buildStage(chain);
      },
    );
  }

  Widget _buildStage(Map<String, dynamic> stage) {

    final species = stage['species'] as Map<String, dynamic>;
    final nextStages = stage['evolves_to'] as List; 

    return FutureBuilder<Map<String, dynamic>>(
      future: obtenerPokemonPorNombre(species['name'].toString()), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError || !snapshot.hasData){
          return Text('No se pudo cagar ${species['name']}.');
        }

        final pokemon = snapshot.data as Map<String, dynamic>?;
        final sprite = (pokemon?['Sprites'] as Map<String, dynamic>?)?['front_default'] as String?;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if(sprite != null)
                  Image.network(sprite, width: 64, height: 64)
                else 
                  const Icon(Icons.catching_pokemon_rounded, size: 64),
                Text(species['name'].toString()),
              ],
            ),
            for (final next in nextStages)
              Padding(
                padding: const EdgeInsets.only(left:20),
                child: _buildStage(Map<String, dynamic>.from(next)),
              ),
          ],
        );
      }
    );
  }
}
