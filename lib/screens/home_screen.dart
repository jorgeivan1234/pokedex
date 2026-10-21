import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/widget/widget.dart';

class HomeScreen extends StatefulWidget {

  // final int pageIndex; 

  const HomeScreen({
    super.key, 
    // required this.pageIndex
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //guardara lista de cantidades de pokemon mas grandes
  late Future<List<Map<String, dynamic>>> _pokemonFuture;

  String? _selectedType;

  //aqui guardaremos en pokemonFuture los pokemon obtenidos de la api
  void _retyLoadingPokemon(){
    setState(() {
      _pokemonFuture = obtenerPokemon();
    });
  }

  @override
  void initState() {
    super.initState();
      _pokemonFuture = obtenerPokemon();  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        //titulo de el app bar
        title: const Text('Pokedex'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.red,
        //color de letra e icono
        foregroundColor: Colors.black,
        //centra el titulo
        centerTitle: true,
      ),
      //llamada al draweScreen
      drawer: const DrawerScreen(),

      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
      //agrega un cuerpo
      body: Center(
        //trae toda la informacion de la api almacenada en obtenerPokemon
        child: FutureBuilder<List<Map<String, dynamic>>> (
          future: _pokemonFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator()
              );
            }

            //en caso de que no pueda cargar la informacion
            if (snapshot.hasError ) {
              return Center(
                child: Column(
                  children: [
                    Text('${snapshot.error}'),
                    TextButton(
                      onPressed: _retyLoadingPokemon, 
                      child: Text('intentar de nuevo')
                    ),
                  ],
                ),
              );
            }

            SizedBox(height: 50);
            
            final pokemon = snapshot.data!;

            final filtrados = pokemon.where ((p){
              if (_selectedType == null) return true;
              return p['types'].any (
                (item) => item['type']['name'] == _selectedType,
              );
            }).toList();
            
            // acomoda la columna para poder traer la informacion recolectada de PokemonFiltres
            return Column(
              children: [
                PokemonFiltres(
                  selectedTypes: _selectedType, 
                  onTyeChanged: (value){
                    setState(() => _selectedType = value);
                  }, 
                   selectGeneration: null, 
                   onGenetarionChanged: (int? value) {  },
                   ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.82,
                    ), 
                    itemCount: filtrados.length,
                    itemBuilder: (context, index) {
                      return CardPokemon(pokemon: filtrados[index]);
                    },
                  )
                ),
              ]
            );
          },
        ),
      ),
    );
  }
}

//api de obtenerPokemon
//pide la lista y trae los datos completos
Future<List<Map<String, dynamic>>> obtenerPokemon() async {
  //consulta la api
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151&offset=0')
  );

  //tratando de pedirlo direcot en español
  // final response = await http.get( 
  //   Uri.parse(respuesta), 
  //   headers: {
  //     'Content-Type' : 'application/json',
  //     'Accept-Language' : 'es-Es',
  //   },
  // ); 

  //convierte a respuesta en un JSON
  final datos = jsonDecode(respuesta.body);
  //guarda la lista de los pokemon de espuesta
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

