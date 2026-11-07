import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/widget/drawer_screen.dart';

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
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Catalogo de Juegos de Pokemon.'),

//                     SizedBox(
//                       height: 340,
//                       child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         separatorBuilder: (_, __) => const SizedBox(width: 12), 
//                         itemCount: ,
//                         itemBuilder: (context, index){
//                           return SizedBox(
// ¿                         );
//                         }
//                       ),
//                     ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}