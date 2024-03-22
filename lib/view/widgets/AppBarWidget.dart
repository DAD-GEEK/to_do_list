import 'package:flutter/material.dart';

class appBarWidget extends StatelessWidget {
  const appBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: const Text('Lista de Tareas'),
      centerTitle: true,
      backgroundColor: Colors.lightBlueAccent,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontFamily: "Madimi One",
        fontSize: 35,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900,
      )
    );
  }
}
