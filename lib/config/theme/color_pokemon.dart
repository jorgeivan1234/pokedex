import 'package:flutter/material.dart';


class PokemonTheme {
  const PokemonTheme();

  static const Map<String, Color> PokemonTypeColors = {
    'fire': Colors.red,
    'water': Color.fromARGB(255, 10, 123, 215),
    'grass': Colors.green,
    'fighting': Colors.grey,
    'flying': Color.fromARGB(186, 239, 197, 194),
    'poison': Colors.purple,
    'ground': Colors.brown,
    'normal':  Color.fromARGB(206, 240, 214, 214), 
    'rock':  Color.fromARGB(255, 77, 52, 43), 
    'bug': Colors.greenAccent,
    'ghost': Colors.deepPurple,
    'steel': Colors.blueGrey,
    'electric': Colors.yellow,
    'psychic': Colors.purpleAccent,
    'ice': Colors.lightBlue,
    'dark': Colors.black,        
    'dragon': Color.fromARGB(255, 116, 2, 255), 
    'fairy':  Colors.pinkAccent, 
    'stellar': Colors.deepOrange,
    'unknown':  Colors.amber, 
  };

  static Color pokemonTypeColor(String, type) => PokemonTypeColors[type.toLowerCase()] ?? Colors.indigo;

}