import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widget/widget.dart';

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
      backgroundColor: Colors.blue,
      body: _ButtonsView(),
    );
  }
}


class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          children: [
            Card(
              child: ListTile(
              leading: Icon(
                  Icons.settings,
                  color: Colors.red,
                ),
                title: Text('Introduccion'),
                trailing: Text('0'),
                 onTap: () => context.go('/tutorial'),
              ),
            ),
          ]
        )
      ),
    );
  }
}