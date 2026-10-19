import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widget/widget.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

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
      
      //trae el drawer a details
      drawer: const DrawerScreen(),

      //trae el widget de busqueda
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            TextField(
              
            )
          ],
        ),
      ),
    );
  }
}