import 'package:flutter/material.dart';

class SoundPokemonFilter extends StatelessWidget {

  final String selectedGroup;
  final ValueChanged<String?> onGroupChanged;
  
  const SoundPokemonFilter({
    super.key, 
    required this.selectedGroup, 
    required this.onGroupChanged
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: selectedGroup, 
          hint: Text('Cries'),
          items: [
            DropdownMenuItem(value: 'lastest', child: Text('lastest')),
            DropdownMenuItem(value: 'legacy', child: Text('legacy')),
          ],
          onChanged: onGroupChanged,
        )
      ]
    );
  }
}