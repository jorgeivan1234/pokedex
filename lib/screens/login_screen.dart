import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final _emailController = TextEditingController();
  bool _isRegistering = false;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future <void> _login() async{
    if(!_formKey.currentState!.validate()) return;

    setState(() => _isRegistering = true);


    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      context.go('/home');
    } on AuthException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message)
        )
      );
    } catch (error, stackTrace) {
      debugPrint('Error al registrar al usuario: $error\n$stackTrace');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo completar el registro. Intentalo de nuevo.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isRegistering = false);
      }
    }
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
                      //   height: 300,
                      //   child: Image.asset(
                      //     'assets/icon/pokemon.png',
                      //     fit: BoxFit.contain,
                      //     errorBuilder: (context, error, stackTrace) =>
                      //     const Center(child: Text('No se pudo cargar la imagen')),
                      //   ),
                      // ),


                      TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: _emailController,
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
                          return null;
                        }
                      ),

                      SizedBox(height: 10),

                      FilledButton(
                        onPressed: _isRegistering ? null : _login,
                        child: _isRegistering
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ) : const Text( 'Iniciar Secion.')
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