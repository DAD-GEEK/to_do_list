import 'package:flutter/material.dart';

PreferredSizeWidget AppBarWidget(String title) {
  return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.lightBlueAccent,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontFamily: "Madimi One",
        fontSize: 35,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900,
      ));
}
