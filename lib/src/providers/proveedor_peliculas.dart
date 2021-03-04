import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:catalogo_peliculas_app/src/modelos/modelo_pelicula.dart';

class ProveedorPeliculas{
  String _apiKey = '29f50e4e760003c8bbc958bb061fe2a6';
  String _url = 'api.themoviedb.org';
  String _idioma = 'es-MX';

  Future<List<Pelicula>> _procesaResp(Uri url) async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> obtEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language' : _idioma
    });
    return await _procesaResp(url);
  }

  Future<List<Pelicula>> obtPopulares() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language' : _idioma
    });
    return await _procesaResp(url);
  }
}