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
              title: 'Acerca del juego',
              icon: Icons.info_outline_rounded,
              child: Column(
                children: [
                  _GameInfoRow(
                    icon: Icons.auto_awesome_outlined,
                    label: 'Generación',
                    value: description?.generacion ?? game.generacion, 
                    foregroundColor: foregroundColor,
                  ),

                  // if (_hasText(description?.desarrollador))
                ],             
              ),
            ),

            Container(
              height: 280,
              decoration: BoxDecoration(
                color: panelColor.withValues(alpha: 0.88),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.videogame_asset_rounded,
                    size: 80,
                    color: foregroundColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Card(
              color: panelColor.withValues(alpha: 0.94),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: DefaultTextStyle(
                  style: TextStyle(color: foregroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: foregroundColor,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _GameTag(
                            icon: Icons.category_outlined,
                            label: description?.genero ?? game.genero,
                            color: panelColor,
                          ),
                          _GameTag(
                            icon: Icons.videogame_asset_outlined,
                            label: description?.plataforma ?? game.plataforma,
                            color: panelColor,
                          ),
                        ],
                      ),
                      

                      const SizedBox(height: 20),

                      // _contentCard (

                      // ),
                      Text(
                        'Información del juego',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: foregroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      _GameInfoRow(
                        icon: Icons.auto_awesome_outlined,
                        label: 'Generación',
                        value: description?.generacion ?? game.generacion,
                        foregroundColor: foregroundColor,
                      ),
                      if (description != null) ...[
                        _GameInfoRow(
                          icon: Icons.code_rounded,
                          label: 'Desarrollador',
                          value: description.desarrollador,
                          foregroundColor: foregroundColor,
                        ),
                        _GameInfoRow(
                          icon: Icons.business_outlined,
                          label: 'Distribuidor',
                          value: description.distribuidor,
                          foregroundColor: foregroundColor,
                        ),
                      ],
                      const SizedBox(height: 16),
                      Text(
                        'Acerca del juego',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: foregroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description?.descripcion ?? game.description,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(
                              color: foregroundColor.withValues(alpha: 0.9),
                              height: 1.5,
                            ),
                      ),
                      if (description == null) ...[
                        const SizedBox(height: 16),
                        Text(
                          'Aún no hay información ampliada para este juego.',
                          style: TextStyle(
                            color: foregroundColor.withValues(alpha: 0.75),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),          
      ),
    );
  }
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
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
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
  final Color foregroundColor;

  const _GameInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: foregroundColor.withValues(alpha: 0.8)),
          const SizedBox(width: 10),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(color: foregroundColor.withValues(alpha: 0.75)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: foregroundColor,
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
      height: 280,
      decoration: BoxDecoration(
        color: panelColor.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(
            Icons.videogame_asset_rounded,
            size: 80,
            color: foregroundColor,
          ),
        ),
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
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}