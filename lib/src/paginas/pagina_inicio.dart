import 'package:catalogo_peliculas_app/src/widgets/cat_pelis_pop.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_app/src/widgets/swiper_personalizado.dart';
import 'package:catalogo_peliculas_app/src/providers/proveedor_peliculas.dart';

class PaginaInicio extends StatelessWidget {
  final proveedorPeliculas = new ProveedorPeliculas();
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
              _swiperTarjetas(),
              _pelisPopulares(context)
            ],
          )
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
        future: proveedorPeliculas.obtEnCines(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if(snapshot.hasData){
            return CardSwiper(
                listaElems: snapshot.data
            );
          } else {
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator()
              )
            );
          }
        });

    /* ;
     */
  }

  Widget _pelisPopulares(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subtitle1,)
          ),
          SizedBox(height: 5.0,),
          FutureBuilder(
            future: proveedorPeliculas.obtPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              if( snapshot.hasData){
                return CatPeliculaPop(peliculas: snapshot.data,);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
          )
        ],
      ),
    );
  }
}
