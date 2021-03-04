import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:catalogo_peliculas_app/src/modelos/modelo_pelicula.dart';
// https://api.themoviedb.org/3/movie/now_playing?api_key=29f50e4e760003c8bbc958bb061fe2a6&language=es-MX&page=1
// https://image.tmdb.org/t/p/w500/uwjaCH7PiWrkz7oWJ4fcL3xGrb0.jpg
class CardSwiper extends StatelessWidget {
  final List<Pelicula> listaElems;
  CardSwiper({@required this.listaElems});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top:10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight:_screenSize.height * 0.5,
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(listaElems[index].obtImgPoster()),
              placeholder: AssetImage('assets/img/loading.gif'),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: listaElems.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
