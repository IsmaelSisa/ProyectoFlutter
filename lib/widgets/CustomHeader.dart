import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset(
        'assets/LOGO.png',
        height: 40,
      ),
      centerTitle: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.5),
        child: Container(
          color: Colors.black,
          height: 0.5,
        ),
      ),
    );
  }

  // 👇 Esta parte es lo que faltaba para que funcione correctamente
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 0.5);
}
