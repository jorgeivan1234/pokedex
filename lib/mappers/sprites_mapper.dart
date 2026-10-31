class SpritesMapper {
  static const _labels = {
    'front_default': 'De frente',
    'back_default': 'Por atrás',
    'front_shiny': 'De frente shiny',
    'back_shiny': 'Por atrás shiny',
  };

  static String buttonLabel(String spritePath) {
    return _labels[spritePath] ?? _formatName(spritePath);
  }

  static String _formatName(String value) {
    return value
        .split('.')
        .where((part) => part != 'other' && part != 'versions')
        .map((part) => part
            .replaceAll('_', ' ')
            .split(' ')
            .map((word) => word.isEmpty
                ? word
                : '${word[0].toUpperCase()}${word.substring(1)}')
            .join(' '))
        .join(' · ');
  }
}
