import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/widget.dart';
import '../shared/infraestructure/service/services.dart';
import '../shared/utils/pokemon_type_color.dart';

class TableTypeScreen extends StatefulWidget {


  const TableTypeScreen({
    super.key, 
  });

  @override
  State<TableTypeScreen> createState() => _TableTypeScreenState();
}

class _TableTypeScreenState extends State<TableTypeScreen> {

  static const _types = [
    'normal', 'fire', 'water', 'grass', 'fighting', 'flying', 'poison', 
    'ground', 'electric', 'ice', 'psychic', 'bug', 'rock', 'ghost', 
    'dragon', 'dark', 'steel', 'fairy',
  ];

  String _selectedType = 'fire';
  late Future<Map<String, dynamic>> _relations;

  @override
  void initState() {
    super.initState();
    _relations = obtenerRelacionTipos(_selectedType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabla de tipos"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: DrawerScreen(),
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/arcanite_gold.gif',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: Container(color: Colors.black.withValues(alpha: 0.4)),
          ),

          SafeArea(
            child:Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFF5F2),
                    Color(0xFFF4F6FC),
                  ],
                ),
              ),
            ),
          ), 
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: Color(0xFFE8EAF0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonFormField<String>(
                        value: _selectedType, 
                        decoration: const InputDecoration(
                          labelText: 'Selecciona un tipo',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.category_outlined),
                        ),
                        items: _types.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(_formatName(type)),
                          );
                        }).toList(),
                        onChanged: (type) { 
                          if (type == null) return;

                          setState(() {
                            _selectedType = type;
                            _relations = obtenerRelacionTipos(type);
                          });
                        },
                      ), 
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: FutureBuilder<Map<String, dynamic>>(
                    future: _relations, 
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.red,),
                        );
                      }

                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('No se pudieron cargar los datos de la tabla de tipos.'),
                        );
                      }

                      final relations = snapshot.data!;

                      return ListView(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
                        children: [
                          Card(
                            elevation: 0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Color(0xFFE8EAF0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 26,
                                    backgroundColor: pokemonTypeColor(_selectedType).withValues(alpha: 0.15),
                                    child: Icon(
                                      Icons.shield_outlined,
                                      color: pokemonTypeColor(_selectedType),
                                      size: 28,
                                    ),
                                  ),

                                  const SizedBox(width: 14),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Defensas del tipo',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          _formatName(_selectedType),
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          _relationSection(
                            'Debil contra',
                            relations['double_damage_from'],
                            Colors.red,
                            Icons.warning_amber_rounded
                          ),

                          _relationSection(
                            'Resiste',
                            relations['half_damage_from'],
                            Colors.green,
                            Icons.verified_user_outlined
                          ),

                          _relationSection(
                            'Inmune a',
                            relations['no_damage_from'],
                            Colors.blueGrey,
                            Icons.block_outlined
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _relationSection(String title, dynamic data, Color color, IconData icon) {
    final names = data is List
          ? data 
            .whereType<Map>()
            .map((item) => item['name'])
            .whereType<String>()
            .toList()
          : <String>[];

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 7),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFE8EAF0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                
                Icon(icon, color: color),

                const SizedBox(height: 8),

                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),

                const Spacer(),

                Text(
                  '${names.length}',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),

            const SizedBox(height: 12),

            if (names.isEmpty)
              const Text('Ninguno')
            else
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: names.map((name) {
                  return Chip(
                    label: Text(_formatName(name)),
                    backgroundColor: color.withValues(alpha: 0.10),
                    side: BorderSide(
                      color: color.withValues(alpha: 0.25),
                    ),
                    labelStyle: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),
          ],
        ), 
      ),
    );
  }

  String _formatName(String name) {
    final formatted = name.replaceAll('-', ' ');
    return '${formatted[0].toUpperCase()}${formatted.substring(1)}';
  }
}
