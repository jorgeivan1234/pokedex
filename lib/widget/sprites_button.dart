import 'package:flutter/material.dart';

List<MapEntry<String, String>> collectSprites(
  Map<String, dynamic> sprites, [
  String prefix = '',
]) {
  final result = <MapEntry<String, String>>[];

  sprites.forEach((key, value) {
    final path = prefix.isEmpty ? key : '$prefix.$key';

    if (value is String && value.isNotEmpty) {
      result.add(MapEntry(path, value));
    } else if (value is Map) {
      result.addAll(
        collectSprites(Map<String, dynamic>.from(value), path),
      );
    }
  });

  return result;
}

class SpritesButton extends StatelessWidget {
  final MapEntry<String, String> sprite;
  final bool isSelected;
  final VoidCallback onPressed;

  const SpritesButton({
    super.key,
    required this.sprite,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: Colors.grey,
      label: Text(sprite.key.replaceAll('.', ' / ')),
      selected: isSelected,
      onSelected: (_) => onPressed(),
    );
  }
}