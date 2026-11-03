import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();


  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _login(){
    if(!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Formulario valido')
      )
    );
  }

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
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/arcanite_gold_night.gif',
              fit: BoxFit.cover
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,                     
                    children: [
                      // SizedBox(
                      //   height: 450,
                      // ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                          Icons.person_outline,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.cyan,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width:1.5,
                            ),
                          ),
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Correo electronico',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                        Icons.email,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width:1.5,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        final email = value?.trim() ?? '';
                        if(email.isEmpty){
                          return 'Escribe tu correo';
                        }
                        final emailIsValid =  RegExp( r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(email);
                        if(!emailIsValid){
                          return 'escribe tu correo valido';
                        }
                        return null;
                      }
                    ),


                    const SizedBox(height: 24),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline,
                            color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width:1.5,
                          ),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Escribre tu contaseña';
                        }
                        if(value.length < 6){
                          return 'usa al menos 6 caracteres';
                        }
                        return null;
                      }
                    ),

                    SizedBox(height: 10),

                      FilledButton(
                        //temporal en lo que funciona
                        // onPressed: _login,
                        onPressed: () => context.go('/home'),
                        child: const Text('Iniciar'),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿No tienes cuenta?',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/register'),
                            child: const Text(
                              'Ingresa aqui',
                              style: TextStyle(
                                color: Colors.cyan
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}