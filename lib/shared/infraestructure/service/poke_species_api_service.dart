import 'dart:convert';
import 'package:http/http.dart' as http;

//api de obtenerPokemon
//pide la lista y trae los datos completos
Future<List<Map<String, dynamic>>> obtenerPokemonSpecies() async {
  //consulta la api
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon-species?limit=251&offset=0')
  );

  if (respuesta.statusCode != 200){
    throw Exception('No se puedieron cargar los datos.');
  }

  //convierte a respuesta en un JSON
  final datos = jsonDecode(respuesta.body);

  //guarda la lista de los pokemon de respuesta
  final resultados = datos['results'];

  final entradas = datos['flavor_text_entries'];
  
  // pide los detalles de cada pokemon y toma los resultados
  return Future.wait<Map<String, dynamic>>(
    resultados.map<Future<Map<String, dynamic>>>((pokemonSpecies) async {
      // los resultados tendran una url con los detalles
      final detalle = await http.get(Uri.parse(pokemonSpecies['url']));
      //trae los detalles recibidos a un mapa y lo devuelve
      return jsonDecode(detalle.body) as Map<String, dynamic>;
    })
  );
}

Future <List<Map<String, dynamic>>> obtenerPokemonPorGeneraciones(int generation) async {
  
  final respuesta = await http.get(Uri.parse('https://pokeapi.co/api/v2/generation/$generation/'));

  if (respuesta.statusCode != 200){
    throw Exception('No se pudieron cargar los pokemon de la generacion $generation.');
  }

  final datos = jsonDecode(respuesta.body) as Map<String, dynamic>;
  final referenciasSpecies = datos['pokemon_species'];

  if (referenciasSpecies is! List) {
    throw const FormatException(
      'La respuesta no contiene la lista de espcies.',
    );
  }

  return Future.wait<Map<String, dynamic>>(
    referenciasSpecies.whereType<Map>().map((referencia) async {
      final speciesUrl = referencia['url'];

      if (speciesUrl is! String) {
        throw const FormatException(
          'La referencia de una especie no contiene una URL valida.',
        );
      }

      final speciesResponse = await http.get(Uri.parse(speciesUrl));

      if (speciesResponse.statusCode != 200) {
        throw Exception('No se pudo cargar el detalle de una especie.');
      }

      final species = jsonDecode(speciesResponse.body) as Map<String, dynamic>;
      final variedades = species['varieties'];

      if (variedades is! List) {
        throw const FormatException(
          'La especie no contiene la lista de variedades.',
        );
      }

      Map<String, dynamic>? variedadPredeterminada;

      for (final variedad in variedades.whereType<Map>()) {
        if (variedad['is_default'] == true) {
          variedadPredeterminada = Map<String, dynamic>.from(variedad);
          break;
        }
      }
      
      if (variedadPredeterminada == null) {
        throw const FormatException(
          'La especie no tiene variedad predeterminada.',
        );
      }
      final referenciaPokemon = variedadPredeterminada['pokemon'];

      if (referenciaPokemon is! Map || referenciaPokemon['url'] is! String) {
        throw const FormatException(
          'La variedad predeterminada no contiene una Url valida.',
        );
      }

      final pokemonResponse = await http.get(
        Uri.parse(referenciaPokemon['url'] as String),
      );

      if (pokemonResponse.statusCode != 200){
        throw const FormatException( 
          'No se pudo cargar el pokemon de una especie.'
        );
      }

      final pokemon = jsonDecode(pokemonResponse.body) as Map<String, dynamic>;

      return {
        'pokemon': pokemon,
        'species': species,
      };
    }),
  );
}

Future<Map<String, dynamic>> obtenerEvolucion(String url) async {
  
  final respuesta = await http.get(Uri.parse(url));
  
  if (respuesta.statusCode != 200){
    throw Exception('No se puedieron cargar las evoluciones.');
  }

  return jsonDecode(respuesta.body) as Map<String, dynamic>;

}

