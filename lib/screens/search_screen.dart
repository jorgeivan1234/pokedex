import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/widget/widget.dart';

class SearchScreen extends StatefulWidget {
  
  // final _SearchController = TextEditingController();

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

//   late Future<List<Map<String, dynamic>>> _pokemonFuture;
// String _busqueda = '';
  
}

class _SearchScreenState extends State<SearchScreen> {

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
                children: const [
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
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