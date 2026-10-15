import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardPokemon extends StatelessWidget {

  final Map<String, dynamic> pokemon; 


  const CardPokemon({
    super.key, 
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //tamaño y altura de la tarjeta
      width: 400,
      height: 400,
      child: Card(

        //permite que no se desborde y sea mas suave el borde
        clipBehavior: Clip.antiAlias,
        //color de la tajeta
        color: Colors.blue.shade800,

        child: InkWell(
          //envia a details
          onTap: () => context.push('/details', extra: pokemon), 

          child: Column(
            // centra el texto dentro de la columna
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //trae la imagen desde la api en linea
              Image.network(
                pokemon['sprites']['front_default'],
                height: 100,
                width: 100,
              ),
          
              Text(
                pokemon['name'], 
                style: TextStyle(
                  //color de las letras
                  color: Colors.white,
                ),
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
                'Experiencia base: ${pokemon['base_experience']} XP',
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
          
              Text(
                'Habilidad: ${pokemon['abilities'][1]['ability']['name']}',
                style: TextStyle(
                  color: Colors.white
                ),
              ),

              // Text(
              //   'Habilidad 2: ${pokemon['abilities'][2]['ability']['name']}',
              //   style: TextStyle(
              //     color: Colors.white
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

