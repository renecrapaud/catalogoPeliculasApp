import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_app/src/modelos/modelo_pelicula.dart';

class CatPeliculaPop extends StatelessWidget {
  final List<Pelicula> peliculas;

  CatPeliculaPop({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _listaTarjetas(context),
      ),
    );
  }

  List<Widget> _listaTarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.obtImgPoster()),
                placeholder: AssetImage('assets/img/loading.gif'),
                fit: BoxFit.cover,
                height: 150.0,
              ),
            ),
            SizedBox(),
            Text(pelicula.title,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.caption,)
          ],
        ),
      );
    }).toList();
  }
}
