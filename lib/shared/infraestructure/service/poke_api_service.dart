import 'dart:convert';
import 'package:http/http.dart' as http;

//api de obtenerPokemon
//pide la lista y trae los datos completos
Future<List<Map<String, dynamic>>> obtenerPokemon() async {
  //consulta la api
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151&offset=0')
  );

  if (respuesta.statusCode != 200){
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
    })
  );
}

Future<Map<String, dynamic>> obtenerPokemonPorNombre(String nombre) async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon/$nombre'),
  );

  if(respuesta.statusCode != 200){
    throw Exception('No se pudo encontrar el pokemon $nombre');
  }

  return jsonDecode(respuesta.body) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> obtenerHabilidad() async {
  final respuesta = await http.get(Uri.parse('https://pokeapi.co/api/v2/ability?offset=0&limit=374'));

  if ( respuesta.statusCode != 200){
    throw Exception('No se pudo cargar la habilidad.');
  }

  return jsonDecode(respuesta.body) as Map<String, dynamic>;
}


Future<List<Map<String, dynamic>>> obtenerHabilidadPorGeneracion(int generation) async {
  final respuesta = await http.get(Uri.parse('https://pokeapi.co/api/v2/generation/$generation/'));

  if ( respuesta.statusCode != 200){
    throw Exception('No se pudo cargar las habilidades de la generacion.');
  }

  final datos = jsonDecode(respuesta.body) as Map<String, dynamic>;
  final habilidades = datos['abilities'];

  if (habilidades is! List){
    throw const FormatException(
      'La respuesta no contiene una lista de habilidades',
    );
  }

  return habilidades
    .whereType<Map>()
    .map((habilidades) => Map<String, dynamic>.from(habilidades))
    .toList();
}