import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import '../shared/widget/widget.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({
    super.key
  });

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {

  // XFile? _foto;
  Uint8List? _fotoBytes;

  Future<void> _elegirFoto() async{
    final imagen = await ImagePicker().pickImage(
      source: ImageSource.gallery
    );
    if (imagen != null && mounted){
      final bytes = await imagen.readAsBytes();
      setState(()   {
        _fotoBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrenador'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/home'), 
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(20),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: _elegirFoto,
                child: CircleAvatar(
                  radius: 80,
                    backgroundImage: _fotoBytes == null
                      ? null
                      : MemoryImage(_fotoBytes!),
                    child: _fotoBytes == null
                      ? const Icon(Icons.person, size: 50)
                      : null,
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Fas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              

              SizedBox(height: 15),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.catching_pokemon,
                    color: Colors.yellow,
                  ),
                  title: Text('Pokemon Favoritos'),
                  trailing: Text('0'),
                  onTap: (){},
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.catching_pokemon,
                    color: Colors.red,
                  ),
                  title: Text('Pokemon Capturados'),
                  trailing: Text('0'),
                  onTap: (){},
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.catching_pokemon,
                    color: Colors.green,
                  ),
                  title: Text('Pokemon Vistos'),
                  trailing: Text('0'),
                  onTap: (){},
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.catching_pokemon,
                    color: Colors.blue,
                  ),
                  title: Text('Victorias'),
                  trailing: Text('0'),
                  onTap: (){},
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.catching_pokemon,
                    color: Colors.black,
                  ),
                  title: Text('Derrotas'),
                  trailing: Text('0'),
                  onTap: (){},
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.catching_pokemon,
                    color: Colors.grey,
                  ),
                  title: Text('Amigos'),
                  trailing: Text('0'),
                  onTap: (){},
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.catching_pokemon,
                    color: Colors.grey,
                  ),
                  title: Text('Regitro de entrenador'),
                  trailing: Text('0'),
                  onTap: () => context.go('/register'),
                ),
              ),
            ],
          ),
        ),
      ),
      //trae el drawer a details
      drawer: const DrawerScreen(),
      //trae el widget de podexnavigatio
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
    );
  }
}