class SpritesMapper {
  static const _labels = {
    'front_default': 'De frente',
    'back_default': 'Por atrás',
    'front_shiny': 'De frente shiny',
    'back_shiny': 'Por atrás shiny',
    'front_female': 'De frente hembra',
    'back_female': 'Por atrás hembra',
    'front_shiny_female': 'De frente shiny hembra',
    'back_shiny_female': 'Por atrás shiny hembra',
    'official-artwork': 'Arte oficial',
    'dream_world': 'Mundo onírico',
    'generation-i': 'Gen. I',
    'generation-ii': 'Gen. II',
    'generation-iii': 'Gen. III',
    'generation-iv': 'Gen. IV',
    'generation-v': 'Gen. V',
    'generation-vi': 'Gen. VI',
    'generation-vii': 'Gen. VII',
    'generation-viii': 'Gen. VIII',
    'generation-ix': 'Gen. IX',
    'red-blue': 'Rojo/Azul',
    'firered-leafgreen': 'Rojo Fuego/Verde Hoja',
    'ruby-sapphire': 'Rubí/Zafiro',
    'gold': 'Oro',
    'silver': 'Plata',
    'crystal': 'Cristal',
    'emerald': 'Esmeralda',
    'diamond-pearl': 'Diamante/Perla',
    'heartgold-soulsilver': 'Oro HeartGold/Plata SoulSilver',
    'black-white': 'Negro/Blanco',
    'omegaruby-alphasapphire': 'Rubí Omega/Zafiro Alfa',
    'ultra-sun-ultra-moon': 'Sol Ultra/Luna Ultra',
    'x-y': 'X/Y',
    'platinum': 'Platino',
    'animated': 'Animado',
    'showdown': 'Showdown',
    'home': 'Home',
    'icons': 'Iconos',
  };

  static String buttonLabel(String spritePath) {
    final parts = spritePath
        .split('.')
        .where((part) => part != 'other' && part != 'versions')
        .map((part) => _labels[part] ?? _formatName(part))
        .toList();

    return parts.join(' · ');
  }

  static String _formatName(String value) {
    final words = value.replaceAll('_', ' ').replaceAll('-', ' ').split(' ');

    return words
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}
