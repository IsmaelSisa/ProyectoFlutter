import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sisa/screens/Registro.dart';
import 'package:sisa/screens/contrasena.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../main.dart';

class Acceso extends StatefulWidget {
  const Acceso({Key? key}) : super(key: key);

  @override
  State<Acceso> createState() => _AccesoState();
}

class _AccesoState extends State<Acceso> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainNavigation()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Image.asset('assets/LOGO.png', height: 80),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido de nuevo',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ingresa para continuar',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Email field
              CustomTextField(
                controller: _emailController,
                hintText: 'Correo electrónico',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),

              // Password field
              CustomTextField(
                controller: _passwordController,
                hintText: 'Contraseña',
                icon: Icons.lock_outline,
                obscureText: true,
                isPassword: true,
              ),
              const SizedBox(height: 10),

              // Error message
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // Remember me & Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (_) {}),
                      const Text('Recordarme'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Contrasena()),
                      );

                    },
                    child: const Text('¿Olvidaste tu contraseña?'),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Login button or loading indicator
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                text: 'Iniciar sesión',
                onPressed: _handleLogin,
              ),

              const SizedBox(height: 25),

              // Registro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No tienes cuenta? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Registro()),
                      );
                    },
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
