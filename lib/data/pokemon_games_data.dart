import '../models/models.dart';
import 'package:flutter/material.dart';

final pokemonGames = [

  PokemonGameModel(
    id: 'Pokemon_Rojo', 
    title: 'Pokemon Edicion Rojo', 
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 27 de febrero de 1996 junto con Pokemon edicion Verde.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_rojo_jap.png', 
    color: Colors.red, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Verde', 
    title: 'Pokemon Edicion Verde', 
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 27 de febrero de 1996 junto con Pokemon edicion Rojo.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_verde_jap.webp', 
    color: Colors.green, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Azul', 
    title: 'Pokemon Edicion Azul', 
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 27 de febrero de 1996.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_blue.jpg', 
    color: Colors.blue, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Amarillo', 
    title: 'Pokemon Edicion Amarillo', 
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 12 de septiembre de 1998.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_yellow.jpg', 
    color: Colors.yellow, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Oro', 
    title: 'Pokemon Edicion Oro', 
    plataforma: 'Game Boy Color', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 21 de Noviembre de 1999 junto con Pokemon edicion Plata.', 
    generacion: 'Segunda Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_oro.jpg', 
    color: Colors.yellowAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Plata', 
    title: 'Pokemon Edicion Plata', 
    plataforma: 'Game Boy Color', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 21 de Noviembre de 1999 junto con Pokemon edicion Oro.', 
    generacion: 'Segunda Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_plata.webp', 
    color: Colors.grey, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Cristal', 
    title: 'Pokemon Edicion Cristal', 
    plataforma: 'Game Boy Color', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 14 de Diciembre de 2000.', 
    generacion: 'Segunda Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_cristal.jpg', 
    color: Colors.cyanAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Rubi', 
    title: 'Pokemon Edicion Rubi', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 21 de noviembre de 2002 junto con Pokemon edicion Zafiro.', 
    generacion: 'Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_rubi.webp', 
    color: Colors.redAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Zafiro', 
    title: 'Pokemon Edicion Zafiro', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 21 de noviembre de 2002 junto con Pokemon edicion Rubi.', 
    generacion: 'Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_zafiro.webp', 
    color: Colors.blueAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Esmeralda', 
    title: 'Pokemon Edicion Esmeralda', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 16 de septiembre de 2004.', 
    generacion: 'Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_esmeralda.webp', 
    color: Colors.greenAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_rojo_fuego', 
    title: 'Pokemon Edicion Rojo Fuego', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 29 de enero de 2004 junto con Pokemon edicion Verde Hoja.', 
    generacion: 'Tercera Generacion, Remake de Primer Generacion', 
    remake: 1,
    imagenAssets: 'assets/images/juegos/pokemon_rojo_fuego.webp', 
    color: Colors.red, 
  ),

  PokemonGameModel(
    id: 'Pokemon_verde_hoja', 
    title: 'Pokemon Edicion Verde Hoja', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 29 de enero de 2004 junto con Pokemon edicion Rojo Fuego.', 
    generacion: 'Tercera Generacion, Remake de Primer Generacion', 
    remake: 1,
    imagenAssets: 'assets/images/juegos/pokemon_verde_hoja.webp', 
    color: Colors.green, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Diamante', 
    title: 'Pokemon Edicion Diamante', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 28 de septiembre de 2006 junto con Pokemon Edicion Perla.', 
    generacion: 'Cuarta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_diamante.webp', 
    color: Colors.lightBlue, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Perla', 
    title: 'Pokemon Edicion Perla', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 28 de septiembre de 2006 junto con Pokemon Edicion Diamante.', 
    generacion: 'Cuarta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_perla.webp', 
    color: Colors.white, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Platino', 
    title: 'Pokemon Edicion Platino', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 13 de septiembre de 2008.', 
    generacion: 'Cuarta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_platino.webp', 
    color: Colors.grey, 
  ),

  PokemonGameModel(
    id: 'Pokemon_HeartGold', 
    title: 'Pokemon Edicion HeartGold ', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 12 de septiembre de 2009 junto con Pokemon Edicion SoulSilver.', 
    generacion: 'Cuarta Generacion, Remake de Segunda Generacion', 
    remake: 2,
    imagenAssets: 'assets/images/juegos/pokemon_heartgold.webp', 
    color: Colors.amber, 
  ),

  PokemonGameModel(
    id: 'Pokemon_SoulSilver', 
    title: 'Pokemon Edicion SoulSilver ', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 12 de septiembre de 2009 junto con Pokemon Edicion HeartGold.', 
    generacion: 'Cuarta Generacion, Remake de Segunda Generacion', 
    remake: 2,
    imagenAssets: 'assets/images/juegos/pokemon_soulsilver.webp', 
    color: Colors.blueGrey.shade700, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Negro', 
    title: 'Pokemon Edicion Negro', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 18 de septiembre de 2010 junto con Pokemon Edicion Blanco.', 
    generacion: 'Quinta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_negro.webp', 
    color: Colors.black, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Blanca', 
    title: 'Pokemon Edicion Blanca', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 18 de septiembre de 2010 junto con Pokemon Edicion Negro.', 
    generacion: 'Quinta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_blanco.webp', 
    color: Colors.white70, 
  ),


  PokemonGameModel(
    id: 'Pokemon_Negro_2', 
    title: 'Pokemon Edicion Negro 2', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 23 de junio de 2012 junto con Pokemon Edicion Blanca 2.', 
    generacion: 'Quinta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_negro_2.webp', 
    color: Colors.black, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Blanca_2', 
    title: 'Pokemon Edicion Blanca 2', 
    plataforma: 'Nintendo DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 23 de junio de 2012 junto con Pokemon Edicion Negro 2.', 
    generacion: 'Quinta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_blanco_2.webp', 
    color: Colors.white70, 
  ),

  PokemonGameModel(
    id: 'Pokemon_X', 
    title: 'Pokemon Edicion X', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 12 de octubre de 2013 junto con Pokemon Edicion Y.', 
    generacion: 'Sexta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_x.webp', 
    color: Colors.lightBlueAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Y', 
    title: 'Pokemon Edicion Y', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 12 de octubre de 2013 junto con Pokemon Edicion X.', 
    generacion: 'Sexta Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_y.webp', 
    color: Colors.red, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Rubi_Omega', 
    title: 'Pokemon Edicion Rubi Omega', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 12 de noviembre de 2014 junto con Pokemon Edicion Zafiro Alfa.', 
    generacion: 'Sexta Generacion, Remake de Tercera Generacion', 
    remake: 3,
    imagenAssets: 'assets/images/juegos/pokemon_rubi_omega.webp', 
    color: Colors.red, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Zafiro_Alfa', 
    title: 'Pokemon Edicion Zafiro Alfa', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 12 de noviembre de 2014 junto con Pokemon Edicion Rubi Omega.', 
    generacion: 'Tercera Generacion, Remake de Tercera Generacion', 
    remake: 3,
    imagenAssets: 'assets/images/juegos/pokemon_zafiro_alfa.webp', 
    color: Colors.red, 
  ),
  
  PokemonGameModel(
    id: 'Pokemon_Sol', 
    title: 'Pokemon Edicion Sol', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 18 de noviembre de 2016 junto con Pokemon Edicion Luna.', 
    generacion: 'Septima Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_sol.webp', 
    color: Colors.yellowAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Luna', 
    title: 'Pokemon Edicion Luna', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 18 de noviembre de 2016 junto con Pokemon Edicion Sol.', 
    generacion: 'Septima Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_luna.webp', 
    color: Colors.indigo, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Ultra_Sol', 
    title: 'Pokemon Edicion Ultra Sol', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 17 de noviembre de 2017 junto con Pokemon Edicion Ultra Luna.', 
    generacion: 'Septima Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_ultra_sol.webp', 
    color: Colors.yellowAccent, 
  ),

  PokemonGameModel(
    id: 'Pokemon_Ultra_Luna', 
    title: 'Pokemon Edicion Ultra Luna', 
    plataforma: 'Nintendo 3DS', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el 17 de noviembre de 2017 junto con Pokemon Edicion Ultra Sol.', 
    generacion: 'Septima Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_ultra_luna.webp', 
    color: Colors.indigo, 
  ),

  PokemonGameModel(
    id: 'Pokemon_', 
    title: 'Pokemon Edicion ', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    description: 'Lanzamiento en japon el .', 
    generacion: 'Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_.webp', 
    color: Colors.blue, 
  ),
];

 