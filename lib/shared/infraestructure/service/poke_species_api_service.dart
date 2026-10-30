import 'dart:convert';
import 'package:http/http.dart' as http;

//api de obtenerPokemon
//pide la lista y trae los datos completos
Future<List<Map<String, dynamic>>> obtenerPokemonSpecies() async {
  //consulta la api
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon-species?limit=151&offset=0')
  );

  if (respuesta.statusCode != 200){
    throw Exception('No se puedieron cargar los datos.');
  }

  //convierte a respuesta en un JSON
  final datos = jsonDecode(respuesta.body);

  //guarda la lista de los pokemon de respuesta
  final resultados = datos['results'];

  final entradas = datos['flavor_text_entries'];

  // final descripcion = entradas.fristWhere(
  //   (entrada) => entrada['language']['name'] == 'es',
  //   orelse: () => null,
  // );

  // tratando de pedirlo direcot en español
  // final response = await http.get( 
  //   Uri.parse(respuesta), 
  //   headers: {
  //     'Content-Type' : 'application/json',
  //     'Accept-Language' : 'es-Es',
  //   },
  // ); 


  // pide los detalles de cada pokemon y toma los resultados
  return Future.wait<Map<String, dynamic>>(
    resultados.map<Future<Map<String, dynamic>>>((pokemonSpecies) async {
      // los resultados tendran una url con los detalles
      final detalle = await http.get(Uri.parse(pokemonSpecies['url']));
      //trae los detalles recibidos a un mapa y lo devuelve
      return jsonDecode(detalle.body) as Map<String, dynamic>;
    })
  );
  // return pokemonCompletos;
}