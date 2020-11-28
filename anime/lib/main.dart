import 'package:anime/modules/anime/anime_page.dart';
import 'package:anime/modules/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/anime': (context) => AnimePage(),
      },
    ),
  );
}
