import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        //titulo de el app bar
        title: const Text('Pokedex'),
        backgroundColor: Colors.red,
        //color de letra e icono
        foregroundColor: Colors.black,
        //centra el titulo
        centerTitle: true,
      ),
      //llamada al draweScreen
      drawer: const DrawerScreen(),

      //agrega un cuerpo
      body: Center(
        //trae toda la informacion de la api almacenada en obtenerPokemon
        child: FutureBuilder<Map<String, dynamic>> (
          future: obtenerPokemon(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            //en caso de que no pueda cargar la informacion
            if (snapshot.hasError || !snapshot.hasData) {
              return const Text('No se pudo cargar la información');
            }
            //el mejor de lo casos trae la data del pokemon
            return CardPokemon(pokemon: snapshot.data!);
          },
        ),
      ),
    );
  }
}

//api de obtenerPokemon
Future<Map<String, dynamic>>obtenerPokemon() async {
  final respuesta = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon/mudkip')
  );

  return jsonDecode(respuesta.body);

}

