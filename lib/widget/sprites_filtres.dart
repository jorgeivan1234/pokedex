import 'package:flutter/material.dart';

class SpritesFiltres extends StatelessWidget {
  
  final String selectedGroup;
  final ValueChanged<String?> onGroupChanged;

  const SpritesFiltres({
    super.key, 
    required this.selectedGroup, 
    required this.onGroupChanged, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: selectedGroup, 
          hint: Text('Sprites'),
          items: [
            DropdownMenuItem(value: 'ninguno', child: Text('Ninguno')),
            DropdownMenuItem(value: 'all', child: Text('Todos')),
            DropdownMenuItem(value: 'main', child: Text('sprites principales')),
            DropdownMenuItem(value: 'other', child: Text('other')),
            DropdownMenuItem(value: 'versions', child: Text('sprites generacionales')),
            DropdownMenuItem(value: 'generation-i', child: Text('Generation-i')),
          ],
          onChanged: onGroupChanged,
        )
      ]
    );
  }
}

