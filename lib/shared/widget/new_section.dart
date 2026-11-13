import 'package:flutter/material.dart';

class NewSection extends StatelessWidget {
  const NewSection({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(12, 16, 12, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //titulo
          Text(
            'Noticias',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          //contenedor que guardara el icono
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colors.outline),
            ),
            //icono de noticia
            child: Row(
              children: [
                Icon(
                  Icons.newspaper_rounded,
                  size: 50,
                  color: colors.primary,
                ),
                const SizedBox(width: 16),
                //texto al lado de el icono que da titulo a la noticia
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Noticias nuevas',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 6),

                      Text(
                        'aqui encontraras las novedades del mundo Pokemon pokemaniaco.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}