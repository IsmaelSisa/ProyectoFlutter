import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../main.dart';

class Acceso extends StatelessWidget {
  const Acceso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo limpio
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Image.asset(
                'assets/LOGO.png',
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido de nuevo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ingresa para continuar',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Campo usuario
              const CustomTextField(
                hintText: 'Nombre de usuario',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),

              // Campo contraseña
              const CustomTextField(
                hintText: 'Contraseña',
                icon: Icons.lock_outline,
                obscureText: true,
                isPassword: true,
              ),
              const SizedBox(height: 10),

              // Recordarme y olvidar contraseña
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (_) {}),
                      const Text("Recordarme"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Botón login
              CustomButton(
                text: 'Iniciar sesión',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainNavigation()),
                  );
                },
              ),

              const SizedBox(height: 25),

              // Registro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿No tienes cuenta? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Regístrate",
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
