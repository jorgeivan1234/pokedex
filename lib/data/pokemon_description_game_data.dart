import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_game_desciption.dart';

final pokemonDescriptionGame = [

  PokemonGameDesciption(
    id: 'Pokemon_Rojo', 
    title: 'Pokemon Edicion Rojo', 
    desarrollador: 'Game Freak', 
    distribuidor: 'Nintendo',
    designer: 'Satoshi Tajiri',
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    descripcion: 'Pokémon Edición Roja y Pokémon Edición Azul (en inglés: Pokémon Red Version & '
    'Pokémon Blue Version) son dos videojuegos de rol desarrollados por Game Freak y publicados '
    'por Nintendo para su consola portátil Game Boy. Son las primeras entregas de la serie de videojuegos '
    'de la franquicia Pokémon. Los videojuegos fueron lanzados a la venta por primera vez en Japón durante '
    '1996 y en Estados Unidos, Europa y Australia casi tres años después. Pokémon Amarillo, una versión especial, '
    'fue lanzada al mercado aproximadamente un año más tarde. Los videojuegos fueron rehechos con posterioridad '
    'para la consola Game Boy Advance bajo los títulos de Pokémon Rojo Fuego y Verde Hoja y publicados en 2004.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_rojo_jap.png', 
    color: Colors.red, 
    imageback: 'assets/images/charizard.gif', 

  ), 

  PokemonGameDesciption(
    id: 'Pokemon_Verde', 
    title: 'Pokemon Edicion Verde', 
    desarrollador: 'Game Freak', 
    distribuidor: 'Nintendo',
    designer: 'Satoshi Tajiri',
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    descripcion: 'Pokémon Rojo, Pokémon Verde y Pokémon Azul (ポケットモンスター 赤 '
    'Pocket Monsters Aka y ポケットモンスター 緑 Pocket Monsters Midori en japonés) '
    'son los primeros videojuegos de Pokémon de la historia, el primer paso que dio '
    'esta saga para convertirse en lo que es hoy en día. Pokémon Verde salió junto a '
    'Pokémon Rojo en 1996 para la consola portátil de la época, Game Boy. Estos juegos '
    'nunca salieron de Japón, en el resto del mundo Pokémon Azul fue la encargada de '
    'acompañar a Pokémon Rojo.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_verde_jap.webp', 
    color: Colors.green, 
    imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_Azul', 
    title: 'Pokemon Edicion Azul', 
    desarrollador: 'Game Freak', 
    distribuidor: 'Nintendo',
    designer: 'Satoshi Tajiri',
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    descripcion: 'Pokémon Rojo y Pokémon Azul (Pokémon Red y Pokémon Blue en inglés, ポケットモンスター 赤 '
    'Pocket Monsters Aka y ポケットモンスター 緑 Pocket Monsters Ao en japonés) son los dos primeros juegos de '
    'Pokémon que fueron lanzados al mercado occidental para la consola portátil Game Boy y posteriormente el 27 '
    'de febrero de 2016 se estrenó en la eShop de Nintendo 3DS. También llamados "Pokémon Edición Roja" y '
    '"Pokémon Edición Azul", son fieles traducciones al castellano de las versiones norteamericanas "Pokémon '
    'Red Version" y "Pokémon Blue Version". Estos juegos utilizan el motor y los gráficos del juego japonés '
    'Pokémon Azul, aunque la disponibilidad de Pokémon se corresponde con las ediciones japonesas Pokémon Rojo '
    'y Pokémon Verde (los primeros dos juegos Pokémon).\n'
    '\nEl término edición/versión se debe a que ambos juegos son casi idénticos en todo sentido. Su única '
    'diferencia a grandes rasgos es la disponibilidad de Pokémon, puesto que cada versión presenta 11 '
    'criaturas exclusivas que no aparecen en la otra edición. Esta es una característica que se mantendría '
    'en todos los títulos siguientes de Pokémon.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_blue.jpg', 
    color: Colors.blue, 
    imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_Amarillo', 
    title: 'Pokemon Edicion Amarillo', 
    desarrollador: 'Game Freak', 
    distribuidor: 'Nintendo',
    designer: 'Satoshi Tajiri',
    plataforma: 'Game Boy', 
    genero: 'RPG', 
    descripcion: 'Pokémon Amarillo (Pokémon Yellow en inglés, ポケットモンスター ピカチュウ Pocket Monsters  '
    'Pikachu en japonés) es el cuarto juego de la primera generación tras Pokémon Verde y Pokémon Rojo y Azul. '
    'También llamado "Pokémon Edición Amarilla" o "Pokémon Edición Especial Pikachu", la principal diferencia '
    'respecto a los títulos anteriores es que está basado en la historia del anime, pero los objetivos y modo '
    'de juego son los mismos que en sus predecesores.', 
    generacion: 'Primera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_yellow.jpg', 
    color: Colors.yellow, 
    imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_Oro', 
    title: 'Pokemon Edicion Oro', 
    desarrollador: 'Game Freak', 
    distribuidor: 'Nintendo',
    designer: 'Satoshi Tajiri',
    plataforma: 'Game Boy Color', 
    genero: 'RPG', 
    descripcion: 'Pokémon Oro y Pokémon Plata (Pokémon Gold y Pokémon Silver en inglés, ポケットモンスター 金 '
    'Pocket Monsters Kin y ポケットモンスターム 銀 Pocket Monsters Gin en japonés) son los juegos RPG de Pokémon '
    'para consola portátil pertenecientes a la segunda generación. Ellos fueron liberados por Game Boy Color. '
    'Los juegos recibirían un título asociado, Pokémon Cristal. \n'
    '\nTambién llamados "Pokémon Edición Oro" y "Pokémon Edición Plata", con estos juegos se añadió un total de '
    '100 Pokémon más a los anteriormente capturables, mediante la aparición de una nueva región (Johto). En '
    'otoño del 2009, Nintendo lanzó los remakes Pokémon Oro HeartGold y Pokémon Plata SoulSilver.',
    generacion: 'Segunda Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_oro.jpg', 
    color: Colors.yellowAccent, 
    imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_Plata', 
    title: 'Pokemon Edicion Plata', 
    desarrollador: 'Game Freak', 
    distribuidor: 'Nintendo',
    designer: 'Satoshi Tajiri',
    plataforma: 'Game Boy Color', 
    genero: 'RPG', 
    descripcion: 'Pokémon Oro y Pokémon Plata (Pokémon Gold y Pokémon Silver en inglés, ポケットモンスター 金 '
    'Pocket Monsters Kin y ポケットモンスターム 銀 Pocket Monsters Gin en japonés) son los juegos RPG de Pokémon '
    'para consola portátil pertenecientes a la segunda generación. Ellos fueron liberados por Game Boy Color. '
    'Los juegos recibirían un título asociado, Pokémon Cristal. \n'
    '\nTambién llamados "Pokémon Edición Oro" y "Pokémon Edición Plata", con estos juegos se añadió un total de '
    '100 Pokémon más a los anteriormente capturables, mediante la aparición de una nueva región (Johto). En '
    'otoño del 2009, Nintendo lanzó los remakes Pokémon Oro HeartGold y Pokémon Plata SoulSilver.',
    generacion: 'Segunda Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_plata.webp', 
    color: Colors.grey, 
    imageback: 'assets/images/juegos/pokemon_plata.webp', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_Cristal', 
    title: 'Pokemon Edicion Cristal', 
    desarrollador: 'Game Freak', 
    distribuidor: 'Nintendo',
    designer: 'Satoshi Tajiri',
    plataforma: 'Game Boy Color', 
    genero: 'RPG', 
    descripcion: 'Pokémon Cristal (Pokémon Crystal en inglés, ポケットモンスターム クリスタル Pocket Monsters '
    'Crystal en japonés), también llamados Pokémon Edición Cristal, es el videojuego para la Game Boy Color. '
    'Es parte de segunda generación. Está asociado con Pokémon Oro y Pokémon Plata. Se le da el protagonismo '
    'de aparecer en portada a Suicune, uno de los tres Perros legendarios. En Japón salió al mercado antes de '
    'la Navidad del 2000, mientras que en el resto del mundo fue durante la segunda mitad del 2001.\n'

    '\nEste juego no era compatible con Game Boy y Game Boy Pocket.', 
    generacion: 'Segunda Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_cristal.jpg', 
    color: Colors.cyanAccent,
    imageback: '', 
  ),

    PokemonGameDesciption(
    id: 'Pokemon_Rubi', 
    title: 'Pokemon Edicion Rubi', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    descripcion: 'Lanzamiento en japon el 21 de noviembre de 2002 junto con Pokemon edicion Zafiro.', 
    generacion: 'Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_rubi.webp', 
    color: Colors.redAccent, desarrollador: '', distribuidor: '', designer: '', imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_Zafiro', 
    title: 'Pokemon Edicion Zafiro', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    descripcion: 'Lanzamiento en japon el 21 de noviembre de 2002 junto con Pokemon edicion Rubi.', 
    generacion: 'Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_zafiro.webp', 
    color: Colors.blueAccent, desarrollador: '', distribuidor: '', designer: '', imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_Esmeralda', 
    title: 'Pokemon Edicion Esmeralda', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    descripcion: 'Lanzamiento en japon el 16 de septiembre de 2004.', 
    generacion: 'Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_esmeralda.webp', 
    color: Colors.greenAccent, desarrollador: '', distribuidor: '', designer: '', imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_rojo_fuego', 
    title: 'Pokemon Edicion Rojo Fuego', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    descripcion: 'Lanzamiento en japon el 29 de enero de 2004 junto con Pokemon edicion Verde Hoja.', 
    generacion: 'Primera Generacion con Pokemon de Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_rojo_fuego.webp', 
    color: Colors.red, desarrollador: '', distribuidor: '', designer: '', imageback: '', 
  ),

  PokemonGameDesciption(
    id: 'Pokemon_verde', 
    title: 'Pokemon Edicion Verde Hoja', 
    plataforma: 'Game Boy Advance', 
    genero: 'RPG', 
    descripcion: 'Lanzamiento en japon el 29 de enero de 2004 junto con Pokemon edicion Rojo Fuego.', 
    generacion: 'Primera Generacion con Pokemon de Tercera Generacion', 
    imagenAssets: 'assets/images/juegos/pokemon_verde_hoja.webp', 
    color: Colors.green, desarrollador: '', distribuidor: '', designer: '', imageback: '', 
  ),

];