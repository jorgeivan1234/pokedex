import 'package:flutter/material.dart';

class PokemonFiltres extends StatelessWidget {

  final String? selectedTypes;
  final int? selectGeneration;
  final ValueChanged<String?> onTyeChanged;
  final ValueChanged<int?> onGenetarionChanged;
  // final Map<String, dynamic> pokemon;


  const PokemonFiltres({
    super.key, 
    required this.selectedTypes, 
    required this.selectGeneration, 
    required this.onTyeChanged, 
    required this.onGenetarionChanged, 
    // required this.pokemon
  });

  @override
  Widget build(BuildContext context) {

    // final types = pokemon['types'];
    // final typePrincipal = types.isNotEmpty
    //   ? types.first['type']['name'].toString()
    //   : '';
    // final colorCard = switch (typePrincipal){
    //     'fire' => Colors.red.shade900,
    //     'water' => const Color.fromARGB(255, 10, 123, 215),
    //     'grass' => Colors.green,
    //     'fighting' => Colors.grey,
    //     'flying' => const Color.fromARGB(186, 239, 197, 194),
    //     'poison' => Colors.purple,
    //     'ground' => Colors.brown,
    //     'normal' =>  const Color.fromARGB(206, 240, 214, 214), 
    //     'rock' => const Color.fromARGB(255, 52, 29, 20), 
    //     'bug' => Colors.greenAccent,
    //     'ghost' => Colors.deepPurple,
    //     'steel' => Colors.blueGrey,
    //     'electric' => Colors.yellow,
    //     'psychic' => Colors.purpleAccent,
    //     'ice' => Colors.lightBlue,
    //     'dark' => Colors.black,        
    //     'dragon' => const Color.fromARGB(255, 116, 2, 255), 
    //     'fairy' =>  Colors.pinkAccent, 
    //     'stellar' => Colors.deepOrange,
    //     'unknown' =>  Colors.amber, 
    //     _ => Colors.indigo              
    //   };

    return Column(
      children: [
        DropdownButtonFormField(
          value: selectedTypes,
          hint: Text('Todos los tipos'),
          items:[
            DropdownMenuItem(value: 'normal', child: Text('Normal')),
            DropdownMenuItem(value: 'fire', child: Text('Fuego')),
            DropdownMenuItem(value: 'water', child: Text('Agua')),
            DropdownMenuItem(value: 'grass', child: Text('Planta')),
            DropdownMenuItem(value: 'fighting', child: Text('Lucha')),
            DropdownMenuItem(value: 'flying', child: Text('Volador')),
            DropdownMenuItem(value: 'poison', child: Text('Veneno')),
            DropdownMenuItem(value: 'ground', child: Text('Tierra')),
            DropdownMenuItem(value: 'rock', child: Text('Roca')),
            DropdownMenuItem(value: 'bug', child: Text('Bicho')),
            DropdownMenuItem(value: 'ghost', child: Text('Fantasma')),
            DropdownMenuItem(value: 'steel', child: Text('Acero')),
            DropdownMenuItem(value: 'electric', child: Text('Electrico')),
            DropdownMenuItem(value: 'psychic', child: Text('Psiquico')),
            DropdownMenuItem(value: 'ice', child: Text('Hielo')),
            DropdownMenuItem(value: 'dragon', child: Text('Dragon')),
            DropdownMenuItem(value: 'dark', child: Text('Siniestro')),
            DropdownMenuItem(value: 'fairy', child: Text('Hada')),
            DropdownMenuItem(value: 'stellar', child: Text('Astral')),
            DropdownMenuItem(value: 'unknown', child: Text('Desconocido')),
          ], 
          onChanged: onTyeChanged
        ),
      ],
    );
  }
}


