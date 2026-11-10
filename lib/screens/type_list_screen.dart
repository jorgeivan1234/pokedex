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
  void initState() {
    super.initState();
    types = obtenerTiposPorGeneracion(widget.generation);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tipo de Pokemon',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),

      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0, 
        onTap: (index){
          if (index == 1) context.go('/search');
        }
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => context.go('/generation'),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/inciales.gif',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: types, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError || !snapshot.hasData){
                return Center(child: Text('No se pudo cargar la lista de tipos de pokemon'));
              }

              final filteredTypes = snapshot.data!.where((type){
                final name = type['name'];
                return name is String &&
                  name.toLowerCase().contains(searchText.toLowerCase());
              }).toList();

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Buscar tipos',
                        labelStyle: TextStyle(
                          color: Colors.white
                        ),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: filteredTypes.isEmpty
                      ? const Center(child: Text(
                        'Este generacion no implemento tabla de tipós',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ))
                      : ListView.builder(
                        itemCount: filteredTypes.length,
                        itemBuilder: (context, index){
                          final type = filteredTypes[index];
                          return ListTile(
                            leading: const Icon(Icons.table_bar),
                            iconColor: Colors.white,
                            title: Text(
                              _formatName(type['name'] as String)
                            ),
                            textColor: Colors.white,
                            trailing: const Icon(Icons.chevron_left_sharp),
                            // este boton envia a cada tipo de pokemon de la tabla de tipos 
                            onTap: () => context.go('/types', extra: type),
                          );
                        }
                      )
                  )
                ],
              );
            }
          ),
        ],
      ),
    );
  }
  String _formatName(String name){
    final formatted = name.replaceAll('-', ' ');
    return formatted.isEmpty
      ? formatted
      : '${formatted[0].toLowerCase()} ${formatted.substring(1)}';
  }
}