//version de prueba

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/widget/widget.dart';

class HabilitysScreen extends StatefulWidget {

  final Map<String, dynamic> pokemon;


  const HabilitysScreen({
    super.key, 
    required this.pokemon, 
  });

  @override
  State<HabilitysScreen> createState() => _HabilitysScreenState();
}

  late Map<String, dynamic> currentPokemon;
  late final List<MapEntry<String, String>> abilitiesOptions;
  String? selectedAbilitiesUrl;
  String selectedAbilitiesGroup = 'all';
  bool isLoading = false;


  // @override
  // void initState() {
  //   super.initState();
  //   final abilities = widget.pokemon['abilities'];
  //   currentPokemon = widget.pokemon;

  //   abilitiesOptions = abilities is Map
  //     ? collectSprites(Map<String, dynamic>.from(abilities))
  //     : [];

  //     if(abilitiesOptions.isNotEmpty) {
  //       final defaultAbilities = abilitiesOptions.where((abilities) => abilities.key == 'name');

  //       selectedAbilitiesUrl = defaultAbilities.isNotEmpty
  //         ? defaultAbilities.first.value
  //         :abilitiesOptions.first.value;
  //     }
  // }

        final visibleAbilities = abilitiesOptions.where((abilities){
        final path = abilities.key;

        switch (selectedAbilitiesGroup){
          case 'main':
          return !path.startsWith('other.') &&
            !path.startsWith('versions.');

          case 'other':
            return path.startsWith('other.');

          case 'versions':
            return path.startsWith('versions.');

          case 'ninguno':
            return false;

          case 'all':
          default:
            return true;
        }
      }).toList();

class _HabilitysScreenState extends State<HabilitysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
        //llama el nombre del pokemon para el titulo desde la api
        title: Text(widget.pokemon['name']),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        centerTitle: true,
      ),

      //whidget scroll con el fin de que no se desborden los pixeles 
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [      
              Card(
                color: Colors.blue,
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if ( selectedAbilitiesUrl != null)
                      Image.network(
                        selectedAbilitiesUrl!,
                        width: 200,
                        height: 200,
                        errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.catching_pokemon_outlined, size: 100),
                      )
                      else 
                      const Icon(Icons.catching_pokemon, size: 100),

                      SpritesFiltres(
                        selectedGroup: selectedAbilitiesGroup, 
                        onGroupChanged: (group){
                          if (group != null) {
                          setState(() {
                              selectedAbilitiesGroup = group;
                            });
                          }
                        },
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: [
                          for (final abilities in visibleAbilities)
                          SpritesButton(
                            sprite: abilities,
                            isSelected: selectedAbilitiesUrl == abilities.value,
                            onPressed: () {
                              setState(() {
                                selectedAbilitiesUrl = abilities.value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
    );
  }
}

