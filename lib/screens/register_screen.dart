import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRegistering = false;
  bool _ocultar = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future <void> _registrar() async {
    if(!_formKey.currentState!.validate()) return;

    setState(() => _isRegistering = true);

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        data: {'display_name': _nameController.text.trim()}
      );
      if (!mounted) return;

      final message = response.session == null
        ? 'Registro enviado. Revisa tu correo para configurar la cuenta.'
        : 'Tu cuenta se creo correctamente.';
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message)
        )
      );
    } on AuthException catch(error) {
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
      // backgroundColor: Colors.blue,   
      appBar: AppBar(
        title: const Text(
          'Registro de entrenador', 
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
              'assets/images/arcanite_gold.gif',
              fit: BoxFit.cover,
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
                      SizedBox(
                        height: 300,
                        child: Image.asset(
                          'assets/icon/logo.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text('No se pudo cargar la imagen')),
                        ),
                      ),

                      const SizedBox(height: 24),

                      TextFormField(
                        controller: _nameController,
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
                        obscureText: _ocultar,
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _ocultar = !_ocultar;
                              });
                            }, 
                            icon: Icon(
                             _ocultar ? Icons.visibility_off : Icons.visibility
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
 
                      const SizedBox(height: 24),

                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'confirma tu contraseña',
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
                            return 'Confirma tu contraseña';
                          }
                          if(value != _passwordController.text){
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        }
                      ),

                      SizedBox(height: 10),

                      FilledButton(
                        onPressed: _isRegistering ? null : _registrar,
                        child: _isRegistering
                          ? const SizedBox(
                              width: 20,
                              height:20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ): const Text ('registrarme'),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿ya tienes cuenta?',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/login'),
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