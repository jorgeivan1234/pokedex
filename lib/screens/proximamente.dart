import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Proximamente extends StatelessWidget {
  const Proximamente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proximamente...'),        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/home'), 
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/agumon.gif',
              fit: BoxFit.fill
            ),
          )
        ],
      ),
    );      
  }
}