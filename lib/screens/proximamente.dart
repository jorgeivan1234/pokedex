import 'package:flutter/material.dart';

class Proximamente extends StatelessWidget {
  const Proximamente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proximamente...'),        
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
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