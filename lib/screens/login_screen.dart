import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,   
      appBar: AppBar(
        title: const Text(
          'Iniciar Secion', 
          style: TextStyle(              
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              child: Column(
                // key: 
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/images/red.jpg',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text('No se pudo cargar la imagen')),
                    ),
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    decoration:  const InputDecoration(
                      labelText: 'Nombre de usuario',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return 'Escribe tu nombre';
                      }
                      return null;
                    }
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    decoration:  const InputDecoration(
                      labelText: 'Correo electronico',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value){
                      if(value == null || value.contains('@')){
                        return 'escribe tu correo valido';
                      }
                      return null;
                    }
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    decoration:  const InputDecoration(
                      labelText: 'contraseña',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value){
                      if(value == null || value.length < 6){
                        return 'usa al menos 6 caracteres';
                      }
                      return null;
                    }
                  ),

                  SizedBox(height: 10),

                  FilledButton(
                    //temporal en lo que funciona
                    onPressed: () => context.go('/home'),
                    // onPressed: _registrar, 
                    child: const Text('Iniciar'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿No tienes cuenta?'),
                      TextButton(
                        onPressed: () => context.go('/register'),
                        child: const Text('Ingresa aqui')
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}