import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/widget/widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red,
      ),
      drawer: DrawerScreen(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () => context.go('/home')
      ),
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/may_cascada.gif',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: NewSection(),
            )
          ),
        ]
      )
    );
  }
}