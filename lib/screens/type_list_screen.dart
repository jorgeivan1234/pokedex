import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/infraestructure/service/poke_api_service.dart';
import 'package:pokedex/shared/widget/drawer_screen.dart';
import 'package:pokedex/shared/widget/navigation_bar.dart';

class TypeListScreen extends StatefulWidget {

  final int generation;

  const TypeListScreen({
    super.key, 
    required this.generation
  });

  @override
  State<TypeListScreen> createState() => _TypeListScreenState();
}

class _TypeListScreenState extends State<TypeListScreen> {

  late final Future<List<Map<String, dynamic>>> types;
  String searchText = '';

  @override
  void dispose() {
    super.dispose();
    types = obtenerTiposPorGeneracion(widget.generation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Tipo de Pokemon',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),

      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0, 
        onTap: (index){
          if (index == 1) context.go('/search');
        }
      ),
    );
  }
}