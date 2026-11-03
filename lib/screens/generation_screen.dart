import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/widget/widget.dart';

class GenerationScreen extends StatelessWidget {

  const GenerationScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Genercion'),
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      backgroundColor: Colors.blue,
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
          return context.go('/home');
        },
      ),
    
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/home'), 
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/bulbasaur_totodile.gif',
              fit: BoxFit.fill
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          ListView(
            children: [
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.red,),
                title: Text(
                  'Generacion 1',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Kanto',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Kanto', 'generation': 1},
                  );
                },          
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.blue.shade900),
                title: Text(
                  'Generacion 2',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Johto',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Johto', 'generation': 2},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.black),
                title: Text(
                  'Generacion 3',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Hoenn',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Hoenn', 'generation': 3},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.deepPurple.shade900),
                title: Text(
                  'Generacion 4',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Sinnoh',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Sinnoh', 'generation': 4},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.white),
                title: Text(
                  'Generacion 5',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Unova',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Unova', 'generation': 5},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.green.shade900),
                title: Text(
                  'Generacion 6',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Kalos',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Kalos', 'generation': 6},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.cyan.shade900),
                title: Text(
                  'Generacion 7',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Alola',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Alola', 'generation': 7},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.yellow.shade900),
                title: Text(
                  'Generacion 8',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Galar',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Galar', 'generation': 8},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon, color: Colors.teal.shade900),
                title: Text(
                  'Generacion 9',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Paldea',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onTap: (){
                  context.push(
                    '/region',
                    extra: {'name': 'Paldea', 'generation': 9},
                  );
                },  
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon),
                title: Text(
                  'Generacion 10',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                subtitle: Text(
                  'Proximamente...',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}