import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widget/widget.dart';

class RegionScreen extends StatelessWidget {

  final String name;
  final int generation;

  const RegionScreen({
    super.key, 
    required this.name, 
    required this.generation
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      backgroundColor: Colors.blue,
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
      body: Center(
        child: Text('Generation $generation - $name'),
      ),
    );
  }
}
