import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/widget/widget.dart';

class JuegosScreen extends StatelessWidget {
  const JuegosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Juegos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.red,
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
              'assets/images/black.gif',
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                const Text(
                  'Catalogo de videojuegos de pokemon',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                const SizedBox(height: 12),

                Card(
                  color: Colors.red.withValues(alpha: 0.8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 280,
                        child: Image.asset(
                          'assets/images/juegos/pokemon_rojo_jap.png',
                          fit: BoxFit.contain
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokemon Edicion Rojo.',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Plataforma: Game Boy.'),
                            Text('Lanzamiento en japon el 27 de febrero de 1996 junto con Pokemon edicion Verde.'),
                            Text('Primera Generacion RPG.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  color: Colors.green.withValues(alpha: 0.8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/juegos/pokemon_verde_jap.webp',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokemon Edicion Verde.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Plataforma: Game Boy.'),
                            Text('Lanzamiento en japon el 27 de febrero de 1996 junto con Pokemon edicion Rojo.'),
                            Text('Primera Generacion RPG.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  color: Colors.blue.withValues(alpha: 0.8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/juegos/pokemon_blue.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokemon Edicion Azul.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Plataforma: Game Boy.'),
                            Text('Lanzamiento en japon el 27 de febrero de 1996.'),
                            Text('Primera Generacion RPG.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  color: Colors.yellow.withValues(alpha: 0.8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/juegos/pokemon_yellow.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokemon Edicion Amarilla.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Plataforma: Game Boy.'),
                            Text('Lanzamiento en japon el 12 de septiembre de 1998.'),
                            Text('Primera Generacion RPG.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  color: Colors.orangeAccent.withValues(alpha: 0.8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/juegos/pokemon_oro.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokemon Edicion Oro.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Plataforma: Game Boy Color.'),
                            Text('Lanzamiento en japon el 21 de Noviembre de 1999 junto con Pokemon edicion Plata.'),
                            Text('Segunda Generacion RPG.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  color: Colors.grey.withValues(alpha: 0.8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/juegos/pokemon_plata.webp',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokemon Edicion Plata.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Plataforma: Game Boy Color.'),
                            Text('Lanzamiento en japon el 21 de Noviembre de 1999 junto con Pokemon edicion Oro.'),
                            Text('Segunda Generacion RPG.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  color: Colors.cyan.withValues(alpha: 0.8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/juegos/pokemon_cristal.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokemon Edicion Cristal.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Plataforma: Game Boy Color.'),
                            Text('Lanzamiento en japon el 14 de Diciembre de 2000.'),
                            Text('Segunda Generacion RPG.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}