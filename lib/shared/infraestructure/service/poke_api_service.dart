import 'dart:convert';
import 'package:http/http.dart' as http;

List<String>? _pokemonNameCache;
Future<List<String>>? _pokemonNamesRequest;

//api de obtenerPokemon
//pide la lista y trae los datos completos
Future<List<Map<String, dynamic>>> obtenerPokemon() async {
  //consulta la api
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=251&offset=0'),
  );

  if (respuesta.statusCode != 200) {
    throw Exception('No se puedieron cargar los datos.');
  }

  //convierte a respuesta en un JSON
  final datos = jsonDecode(respuesta.body);

  //guarda la lista de los pokemon de respuesta
  final resultados = datos['results'];

  // pide los detalles de cada pokemon y toma los resultados
  return Future.wait<Map<String, dynamic>>(
    resultados.map<Future<Map<String, dynamic>>>((pokemon) async {
      // los resultados tendran una url con los detalles
      final detalle = await http.get(Uri.parse(pokemon['url']));
      //trae los detalles recibidos a un mapa y lo devuelve
      return jsonDecode(detalle.body) as Map<String, dynamic>;
    }),
  );
}

Future<Map<String, dynamic>> obtenerPokemonPorNombre(String nombre) async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon/$nombre'),
  );

  if (respuesta.statusCode != 200) {
    throw Exception('No se pudo encontrar el pokemon $nombre');
  }

  return jsonDecode(respuesta.body) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> obtenerHabilidad() async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/ability?offset=0&limit=374'),
  );

  if (respuesta.statusCode != 200) {
    throw Exception('No se pudo cargar la habilidad.');
  }

  return jsonDecode(respuesta.body) as Map<String, dynamic>;
}

Future<List<Map<String, dynamic>>> obtenerHabilidadPorGeneracion(
  int generation,
) async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/generation/$generation/'),
  );

  if (respuesta.statusCode != 200) {
    throw Exception('No se pudo cargar las habilidades de la generacion.');
  }

  final datos = jsonDecode(respuesta.body) as Map<String, dynamic>;
  final habilidades = datos['abilities'];

  if (habilidades is! List) {
    throw const FormatException(
      'La respuesta no contiene una lista de habilidades',
    );
  }

  return habilidades
      .whereType<Map>()
      .map((habilidad) => Map<String, dynamic>.from(habilidad))
      .toList();
}

Future<List<Map<String, dynamic>>> obtenerMovimientosPorGeneracion(
  int generation,
) async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/generation/$generation/'),
  );

  if (respuesta.statusCode != 200) {
    throw Exception('No se pudo cargar los movimientos de la generacion.');
  }
  final datos = jsonDecode(respuesta.body) as Map<String, dynamic>;
  final movimientos = datos['moves'];

  if (movimientos is! List) {
    throw const FormatException(
      'La respuesta no continene la lista de Movimientos.',
    );
  }
  return movimientos
      .whereType<Map>()
      .map((movimiento) => Map<String, dynamic>.from(movimiento))
      .toList();
}

Future<List<Map<String, dynamic>>> obtenerTiposPorGeneracion(
  int generation,
) async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/generation/$generation/'),
  );

  if (respuesta.statusCode != 200) {
    throw Exception('N se pudo cargar los tipos de la generacion.');
  }
  final datos = jsonDecode(respuesta.body) as Map<String, dynamic>;
  final types = datos['types'];

  if (types is! List) {
    throw const FormatException('La respuesta no contiene la lista de tipos.');
  }
  return types
      .whereType<Map>()
      .map((type) => Map<String, dynamic>.from(type))
      .toList();
}

Future<List<Map<String, dynamic>>> obtenerMegaEvoluciones( 
  String pokemonName,
) async {
  final normalizedName = pokemonName.trim().toLowerCase();
  final mega = '$normalizedName-mega';
  final names = await _obtenerNombresPokemon();
  final megaNames = names
    .where((name) => name == mega || name.startsWith('$mega-'))
    .toList();
  return Future.wait(megaNames.map(obtenerPokemonPorNombre));
}

Future<List<String>> _obtenerNombresPokemon() async {
  if (_pokemonNameCache != null) {
    return _pokemonNameCache!;
  }

  final pendingRequest = _pokemonNamesRequest;
  if (pendingRequest != null){
    return pendingRequest;
  }

  final request = _cargarNombresPokemon();
  _pokemonNamesRequest = request;

  try {
    final names = await request;
    _pokemonNameCache = names;
    return names;
  } catch (_) {
    _pokemonNamesRequest = null;
    rethrow;
  }
}

Future<List<String>> _cargarNombresPokemon() async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000')
  );

  if (respuesta.statusCode != 200) {
    throw Exception('No se pudieron cargar los pokemon.');
  }

  final datos = jsonDecode(respuesta.body) as Map<String, dynamic>;
  final resultados = datos['results'];

  if (resultados is! List) {
    throw const FormatException(
      'La respuesta no contiene la lista de algun Pokemon.'
    );
  }

  return resultados
    .whereType<Map>()
    .map((pokemon) => pokemon['name'])
    .whereType<String>()
    .toList();
}