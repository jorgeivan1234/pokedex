import 'package:flutter/material.dart';

class PokemonHero extends StatelessWidget {

  final String name;
  final int id;
  final String imageUrl;
  final List<String> types;
  final Color color;
  final VoidCallback onCry;
  final VoidCallback onLongpress;
    
  const PokemonHero({
    super.key, 
    required this.name, 
    required this.id, 
    required this.imageUrl, 
    required this.types, 
    required this.color, 
    required this.onCry, 
    required this.onLongpress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha:  0.95), 
            color.withValues(alpha: 0.65),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onLongPress: onLongpress,
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: 180,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___)=> const Icon(
                    Icons.catching_pokemon,
                    size: 120,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                    '#${id.toString().padLeft(3, '0')}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton.filledTonal(
                  onPressed: onCry, 
                  tooltip: 'Escuchar sonido.',
                  icon: Icon(Icons.volume_up_rounded)
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 8,
            children: [
              for (final type in types)
              Chip(
                label: Text(type),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }
}