import 'package:flutter/material.dart';

Color pokemonTypeColor(String type) {
  return switch (type){
    'fire' => Colors.red,
    'water' => const Color.fromARGB(255, 10, 123, 215),
    'grass' => Colors.green,
    'fighting' => Colors.grey,
    'flying' => const Color.fromARGB(186, 239, 197, 194),
    'poison' => Colors.purple,
    'ground' => Colors.brown,
    'normal' =>  const Color.fromARGB(206, 240, 214, 214), 
    'rock' => const Color.fromARGB(255, 52, 29, 20), 
    'bug' => Colors.greenAccent,
    'ghost' => Colors.deepPurple,
    'steel' => Colors.blueGrey,
    'electric' => Colors.yellow,
    'psychic' => Colors.purpleAccent,
    'ice' => Colors.lightBlue,
    'dark' => Colors.black,        
    'dragon' => const Color.fromARGB(255, 116, 2, 255), 
    'fairy' =>  Colors.pinkAccent, 
    'stellar' => Colors.deepOrange,
    'unknown' =>  Colors.amber, 
    _ => Colors.indigo              
  };
}

Color pokemonTypeColor2(String type) {
  return switch (type){
    'fire' =>  const Color.fromARGB(255, 245, 242, 230),
    'water' => const Color.fromARGB(255, 255, 180, 150),
    'grass' => const Color.fromARGB(255, 218, 223, 211),
    'fighting' => const Color.fromARGB(255, 158, 158, 158),
    'flying' => const Color.fromARGB(255, 34, 116, 110),
    'poison' => const Color.fromARGB(255, 243, 213, 117),
    'ground' => const Color.fromARGB(255, 173, 216, 230),
    'normal' =>  const Color.fromARGB(255, 210, 230, 220), 
    'rock' => const Color.fromARGB(255, 181, 198, 169), 
    'bug' => const Color.fromARGB(255, 245, 240, 230),
    'ghost' => const Color.fromARGB(255, 164, 180, 114),
    'steel' => const Color.fromARGB(255, 230, 215, 200),
    'electric' => const Color.fromARGB(255, 253, 241, 191),
    'psychic' => const Color.fromARGB(255, 220, 237, 219), 
    'ice' => const Color.fromARGB(255, 168, 183, 143), 
    'dark' => const Color.fromARGB(255, 245, 245, 242),      
    'dragon' => const Color.fromARGB(255, 210, 245, 225), 
    'fairy' =>  const Color.fromARGB(255, 210, 245, 235), 
    'stellar' => const Color.fromARGB(255, 200, 230, 240), 
    'unknown' =>  const Color.fromARGB(255, 255, 229, 153), 
    _ => const Color.fromARGB(255, 234, 210, 172),             
  };
}