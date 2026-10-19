import 'package:flutter/material.dart';

class PokemonFiltres extends StatelessWidget {

  final String? selectedTypes;
  final int? selectGeneration;
  final ValueChanged<String?> onTyeChanged;
  final ValueChanged<int?> onGenetarionChanged;

  const PokemonFiltres({
    super.key, 
    required this.selectedTypes, 
    required this.selectGeneration, 
    required this.onTyeChanged, 
    required this.onGenetarionChanged
  });

  @override
  Widget build(BuildContext context) {
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


