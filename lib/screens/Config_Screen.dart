import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/widget/widget.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configuracion',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/home'), 
      ),
      drawer: const DrawerScreen(),
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0, 
        onTap: (index){
          if ( index == 1) context.go('/search');
        }
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/down.gif',
              fit: BoxFit.cover 
            ),
          ),
          SafeArea(
            child: _BottomView(), 
          )
        ],
      ),
    );
  }
}


class _BottomView extends StatefulWidget {

  const _BottomView();

  @override
  State<_BottomView> createState() => __BottomViewState();
}

class __BottomViewState extends State<_BottomView> {

  bool temaOscuro = false;
  bool efectos = true;
  bool sonidos = true;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Card(
              color: Colors.white.withValues(alpha: 0.7),
              child: SwitchListTile(
                secondary: const Icon(
                  Icons.dark_mode_outlined, 
                  color: Colors.red
                ),
                title: const Text('Tema oscuro'),
                value: temaOscuro, 
                onChanged: (value) {
                  setState(() => temaOscuro = value);
                },
              ),
            ),

            Card(
              color: Colors.white.withValues(alpha: 0.7),
              child: SwitchListTile(
                secondary: const Icon(
                  Icons.animation, 
                  color: Colors.red
                ),
                title: const Text('Efectos visuales'),
                value: efectos, 
                onChanged: (value) {
                  setState(() => efectos = value);
                },
              ),
            ),

            Card(
              color: Colors.white.withValues(alpha: 0.7),
              child: SwitchListTile(
                secondary: const Icon(
                  Icons.volume_up, 
                  color: Colors.red
                ),
                title: const Text('Sonidos'),
                value: sonidos, 
                onChanged: (value) {
                  setState(() => sonidos = value);
                },
              ),
            ),

            Card(
              color: Colors.white.withValues(alpha: 0.7),
              child: ListTile(
                leading: const Icon(
                  Icons.settings, 
                  color: Colors.red
                ),
                title: const Text('Introduccion'),
                trailing: const Icon(Icons.arrow_forward), 
                onTap: () => context.go('/tutorial')
              ),
            ),

            Card(
              color: Colors.white.withValues(alpha: 0.7),
              child: ListTile(
                leading: const Icon(
                  Icons.language, 
                  color: Colors.red
                ),
                title: const Text('Idioma'),
                subtitle: const Text('Español'),
                trailing: const Icon(Icons.arrow_forward), 
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Selecciona tu idioma'
                        '\n English \n Spanish \n Japanese'
                      ),
                    )
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}