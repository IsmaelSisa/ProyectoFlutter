import 'package:flutter/material.dart';
import '../widgets/CustomHeader.dart';

class NosotrosPage extends StatelessWidget {
  const NosotrosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset(
                'assets/imagen1.png', // Imagen del exoesqueleto
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Sobre nosotros',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Technaid es una compañía de referencia en el desarrollo de soluciones tecnológicas avanzadas, '
                      'especializándose en áreas clave como la biomecánica, la rehabilitación, el análisis del movimiento, '
                      'la realidad virtual y la robótica. Con una sólida trayectoria en investigación, participamos en '
                      'numerosos proyectos de gran relevancia a nivel nacional y europeo, colaborando con universidades e '
                      'investigadores de renombre.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
