import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_app/src/paginas/pagina_inicio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'App Películas',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => PaginaInicio(),
      },
    );
  }
}