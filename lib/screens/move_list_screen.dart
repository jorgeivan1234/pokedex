import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/infraestructure/service/poke_api_service.dart';
import 'package:pokedex/shared/widget/drawer_screen.dart';
import 'package:pokedex/shared/widget/navigation_bar.dart';

class MoveListScreen extends StatefulWidget {
  
  final int generation;
  
  const MoveListScreen({
    super.key, 
    required this.generation
  });

  @override
  State<MoveListScreen> createState() => _MoveListScreenState();
}

class _MoveListScreenState extends State<MoveListScreen> {
  late final Future<List<Map<String, dynamic>>> moves;
  String searchText = '';
  // abilities = obtenerHabilidadesPorGeneracion(widget.generation);
  @override
  void initState() {
    super.initState();
    moves = obtenerMovimientosPorGeneracion(widget.generation);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Movimientos'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: const DrawerScreen(),

      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0, 
        onTap: (index) {
          if (index == 1) context.go('/home');
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () => context.go('/generation')
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/lira.gif',
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: moves, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError || !snapshot.hasData){
                return Center(child: Text('No se pudo carga la lista de movimientos.'));
              }

              final filteredMoves = snapshot.data!.where((move) {
                final name = move['name'];
                return name is String &&
                  name.toLowerCase().contains(searchText.toLowerCase());
              }).toList();

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Buscar Movimentos',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.black,
                        border: OutlineInputBorder()
                      ),
                      onChanged: (value){
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: filteredMoves.isEmpty
                      ? const Center(
                        child: Text(
                          'Esta generacion no tiene movimientos originarios de esta region',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                      : ListView.builder(
                        itemCount: filteredMoves.length,
                        itemBuilder: (context, index) {
                          final move = filteredMoves[index];
                          return ListTile(
                            leading: Icon(Icons.move_down),
                            iconColor: Colors.black,
                            title: Text(
                              _formatName(move['name'] as String),
                            ),
                            textColor: Colors.black,
                            trailing: const Icon(
                              Icons.chevron_left_outlined,
                              color: Colors.black,
                            ),
                            onTap: () => context.go('/'),
                          );
                        },
                      ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
  String _formatName(String name){
    return name
      .split('-')
      .map(
        (part) => part.isEmpty
          ? part 
          : '${part[0].toUpperCase()} ${part.substring(1)}'
      )
      .join(' ');
  }
}