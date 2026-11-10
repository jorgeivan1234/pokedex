import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/data/pokemon_games_data.dart';
import 'package:pokedex/shared/widget/pokemon_game_card.dart';
import '../shared/widget/widget.dart';

class JuegosScreen extends StatelessWidget {
  const JuegosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Juegos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      backgroundColor: Colors.blue,
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
          return context.go('/home');
        },
      ),
    
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/home'), 
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/black.gif',
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Catalogo de videojuegos de pokemon',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder( 
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: pokemonGames.length,
                    itemBuilder: (context, index) {
                      final game = pokemonGames[index];
                  
                      return PokemonGameCard(
                        game: game, 
                        onLongPress: () => context.push(
                          '/Game-Description',
                          extra: game,
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}