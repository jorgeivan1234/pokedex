import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/infraestructure/service/services.dart';

import '../shared/widget/widget.dart';

class AbilityListScreen extends StatefulWidget {

  const AbilityListScreen({
    super.key
  });

  @override
  State<AbilityListScreen> createState() => _AbilityListScreenState();
}

class _AbilityListScreenState extends State<AbilityListScreen> {

  late final Future<List<Map<String, dynamic>>> abilities;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    abilities = obtenerHabilidad().then((response) {
      final results = response['results'];
      if (results is! List) {
        throw const FormatException('La respuesta no contiene habilidades.');
      }

      return results
          .whereType<Map>()
          .map((ability) => Map<String, dynamic>.from(ability))
          .where(
            (ability) => ability['name'] is String && ability['url'] is String,
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Lista de Habilidades'),
        backgroundColor: Colors.blueAccent.shade700,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),

      //trae el drawer a details
      drawer: const DrawerScreen(),
      //trae el widget de podexnavigatio
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
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
              'assets/images/charmander_pidgey.jpg',
              fit: BoxFit.cover,
            ),    
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          FutureBuilder<List<Map<String,dynamic>>>(
            future: abilities,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child:  CircularProgressIndicator());
              }

              if (snapshot.hasError || !snapshot.hasData) {
                return Center(child: Text('No se puede cargar la lista de habilidades.'));
              }

              final filteredAbilities = snapshot.data!.where((ability) {
                final name = ability['name'];
                return name is String &&
                    name.toLowerCase().contains(searchText.toLowerCase());
              }).toList();

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsGeometry.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Buscar habilidad',
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
                    child: filteredAbilities.isEmpty 
                    ? const Center(child: Text('No se encontraron habilidades.'))
                    : ListView.builder(
                      itemCount: filteredAbilities.length,
                      itemBuilder: (context, index) {
                        final ability = filteredAbilities[index];
                        return ListTile(
                          leading: const Icon(Icons.psychology),
                          iconColor: Colors.white,
                          title: Text(
                            _formatName(ability['name'] as String),
                          ),
                          textColor: Colors.white,
                          trailing: const Icon(Icons.chevron_left_outlined),
                          onTap: () => context.push(
                            '/habilitys',
                            extra: ability
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ]
      )
    );
  }

  String _formatName(String name) {
    final formatted = name.replaceAll('-', '');
    return formatted.isEmpty
      ? formatted
      : '${formatted[0].toUpperCase()} ${formatted.substring(1)}';
  }
}