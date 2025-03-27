import 'package:flutter/material.dart';
import '../widgets/CustomHeader.dart';

class ComunicacionesPage extends StatelessWidget {
  const ComunicacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(),
      body: const Center(
        child: Text('Esta es la página de Comunicaciones'),
      ),
    );
  }
}
