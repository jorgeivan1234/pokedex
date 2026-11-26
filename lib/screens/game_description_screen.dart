import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon_description_game_data.dart';
import 'package:pokedex/models/pokemon_game_model.dart';

class GameDescriptionScreen extends StatelessWidget {

  final PokemonGameModel game;
  
  const GameDescriptionScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final matchingDescriptions = pokemonDescriptionGame.where(
      (item) => item.id == game.id,
    );
    final description = matchingDescriptions.isEmpty
        ? null
        : matchingDescriptions.first;
    
    final title = description?.title ?? game.title;
    final imagePath = description?.imagenAssets ?? game.imagenAssets;
    final panelColor = description?.color ?? game.color;
    final foregroundColor =
        ThemeData.estimateBrightnessForColor(panelColor) == Brightness.dark
        ? Colors.white
        : const Color(0xFF17202B);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 63, 109),
      appBar: AppBar(
        title: Text(
          "Detalles del juego",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF17202B),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
          children: [
            _GameHero(
              title: title,
              imagePath: imagePath,
              panelColor: panelColor,
              foregroundColor: foregroundColor,
              generation: description?.generacion ?? game.generacion,
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _GameTag(
                  icon: Icons.videogame_asset_outlined,
                  label: description?.plataforma ?? game.plataforma,
                  color: panelColor,
                ),
                _GameTag(
                  icon: Icons.category_outlined,
                  label: description?.genero ?? game.genero,
                  color: panelColor,
                ),
              ],
            ),

            const SizedBox(height: 20),

            _ContentCard(
              title: 'Ficha del juego',
              icon: Icons.info_outline_rounded,
              child: Column(
                children: [
                  _GameInfoRow(
                    icon: Icons.auto_awesome_outlined,
                    label: 'Generación',
                    value: description?.generacion ?? game.generacion, 
                  ),

                  if (_hasText(description?.desarrollador))
                    _GameInfoRow(
                      icon: Icons.code_rounded,
                      label: 'Desarrollador',
                      value: description!.desarrollador,
                    ),
                  if (_hasText(description?.distribuidor))
                    _GameInfoRow(
                      icon: Icons.business_outlined,
                      label: 'Distribuidor',
                      value: description!.distribuidor,
                    ),
                  if (_hasText(description?.designer))
                    _GameInfoRow(
                      icon: Icons.draw_outlined,
                      label: 'Diseñador',
                      value: description!.designer,
                    ),
                ],             
              ),
            ),

            const SizedBox(height: 14),

            _ContentCard(
              title: 'Acerca del juego', 
              icon: Icons.menu_book_outlined, 
              child: Text(
                description?.descripcion ?? game.description,
                style: TextStyle(
                  color: Colors.blueGrey.shade800,
                  fontSize: 15,
                  height: 1.65,
                ),
              ),
            ),

            if (description == null) ...[
              const SizedBox(height: 16),
              Text(
                'Aún no hay información ampliada para este juego.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ]
          ]
        )
      )
    );
  }

  bool _hasText(String? value) => value != null && value.trim().isNotEmpty;
}

class _GameTag extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _GameTag({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _GameInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _GameInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon, 
            size: 20, 
            color: const Color(0xFF718096)),

          const SizedBox(width: 10),

          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF718096),
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF263442),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GameHero extends StatelessWidget {

  final String title;
  final String imagePath;
  final Color panelColor;
  final Color foregroundColor;
  final String generation;

  const _GameHero({
    required this.title,
    required this.imagePath,
    required this.panelColor,
    required this.foregroundColor,
    required this.generation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors : [
            panelColor.withValues(alpha: 0.9),
            Color.lerp(panelColor, Colors.black, 0.16)!
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: -35,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: foregroundColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: foregroundColor.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Text(
                    generation.toUpperCase(),
                    style: TextStyle(
                      color: foregroundColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),

                Expanded(
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => Icon(
                        Icons.videogame_asset_outlined,
                        size: 82,
                        color: foregroundColor.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ),

                Text(
                  title, 
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize:25,
                    height: 1.1,
                    fontWeight: FontWeight.w800,
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

class _ContentCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final Widget child;

  const _ContentCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shadowColor: const Color(0xFF17202B).withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF526273), size: 21),

            const SizedBox(width: 9),

            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF17202B),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            child,
          
          ],
        ),
      ),
    );
  }
}