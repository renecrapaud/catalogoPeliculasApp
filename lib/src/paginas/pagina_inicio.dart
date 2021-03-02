import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_app/src/widgets/swiper_personalizado.dart';

class PaginaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cartelera'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              _swiperTarjetas()
            ],
          )
      ),
    );
  }

  Widget _swiperTarjetas() {
    return CardSwiper(
      listaElems: [1,2,3,4,5]
    );
  }
}
