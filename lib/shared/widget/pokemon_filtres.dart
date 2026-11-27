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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: DropdownButtonFormField<String>(
          value: selectedTypes ?? "",
          isExpanded: true,
          menuMaxHeight: 300,
          dropdownColor: const Color.fromARGB(130, 53, 155, 238),
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
          ),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            labelText: 'Filtrar por tipo',
            prefixIcon: Icon(
              Icons.filter_alt,
              color: Colors.red,
            ),
            filled: true,
            fillColor: const Color.fromARGB(130, 53, 155, 238),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          items: const [
            DropdownMenuItem(value: '', child: Text('')),
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
          onChanged: (value) {
            onTyeChanged(value == null || value.isEmpty ? null : value);
          }
        ),
    );
  }
}


