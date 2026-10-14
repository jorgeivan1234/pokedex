import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatelessWidget {

  final Map<String, dynamic> pokemon;

  const DetailsScreen({
    super.key, 
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        backgroundColor: Colors.red,
        //llama el nombre del pokemon para el titulo desde la api
        title: Text(pokemon['name']),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              pokemon['spirtes']['front_default'],
              width: 100,
              height: 100,
            ),

            Text(
              pokemon['name'].toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              )
              
            ),

            SizedBox(width: 12),
                
              Text(
                'Pokemon #${pokemon['id']}',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
          
              SizedBox(width: 12),
          
              Text(
                'Experiencia: ${pokemon['base_experience']} XP',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
          
              SizedBox(width: 12),
          
              Text(
                'Tamaño: ${pokemon['height']} M',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
          
              Text(
                'Peso: ${pokemon['weight']} Kg',
                style: TextStyle(
                  color: Colors.white
                ),
              ),

              Image.network(
              pokemon['spirtes']['front_default'],
              width: 100,
              height: 100,
            ),
          ],
        ),
      )
    );
  }
}



