import 'dart:convert';
import 'dart:io';
import 'dart:async';

// class Actor {
//   int castId;
//   String character;
//   String creditId;
//   int gender;
//   int id;
//   String name;
//   int order;
//   String profilePath;

//   Actor.fromJsonMap(Map<String, dynamic> json) {
//     castId = json["cast_id"];
//     character = json["character"];
//     creditId = json["credit_id"];
//     gender = json["gender"];
//     id = json["id"];
//     name = json["name"];
//     order = json["order"];
//     profilePath = json["profile_path"];
//   }
// }

// class Pelicula {
//   String uniqueId;

//   int voteCount;
//   int id;
//   bool video;
//   double voteAverage;
//   String title;
//   double popularity;
//   String posterPath;
//   String originalLanguage;
//   String originalTitle;
//   List<int> genreIds;
//   String backdropPath;
//   bool adult;
//   String overview;
//   String releaseDate;

//   Pelicula.fromJsonMap(Map<String, dynamic> json) {
//     voteCount = json["vote_count"];
//     id = json["id"];
//     video = json["video"];
//     voteAverage = json["vote_average"] / 1;
//     title = json["title"];
//     popularity = json["popularity"] / 1;
//     posterPath = json["poster_path"];
//     originalLanguage = json["original_language"];
//     originalTitle = json["original_title"];
//     genreIds = json["genre_ids"].cast<int>();
//     backdropPath = json["backdrop_path"];
//     adult = json["adult"];
//     overview = json["overview"];
//     releaseDate = json["release_date"];
//   }
// }

// class Cast {
//   List<Actor> actores = new List();

//   Cast.fromJSonList(List<dynamic> jsonList) {
//     if (jsonList == null) return;

//     jsonList.forEach((item) {
//       final actor = Actor.fromJsonMap(item);
//       actores.add(actor);
//     });
//   }
// }

// class PeliculasProvider {
//   HttpClient http = new HttpClient();

//   String _apikey = '600aa6d3c801e8a8e3c76dec9ea39427';
//   String _url = 'api.themoviedb.org';
//   String _language = 'es-ES';

//   int _popularesPage = 0;
//   bool _cargando = false;

//   List<Pelicula> _populares = new List();

//   final _popularesStreamController =
//       StreamController<List<Pelicula>>.broadcast();

//   Function(List<Pelicula>) get popularsSink =>
//       _popularesStreamController.sink.add;

//   Stream<List<Pelicula>> get popularsStream =>
//       _popularesStreamController.stream;

//   void disposeStreams() {
//     _popularesStreamController?.close();
//   }

//   Future<List<Actor>> getCast(String peliId) async {
//     final url = Uri.https(_url, '3/movie/120/credits',
//         {'api_key': _apikey, 'language': _language});

//     final resp = await http.get(url);
//     final decodedData = json.decode(resp.body);

//     final cast = new Cast.fromJSonList(decodedData['cast']);

//     return cast.actores;
//   }
// }

class Digimon {
  final String name;
  String imageUrl;
  String apiname;
  String levelDigimon;

  int rating = 10;

  Digimon(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      apiname = name.toLowerCase();
      var uri =
          new Uri.https('www.mockachino.com', '/1f29f044-51f8-48/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      var data = json.decode(responseBody);
      imageUrl = data["image"];
      levelDigimon = data["real_name"];
      // for (var i = 0; i <= data.length; i++) {
      //   if (this.name == data[i]["first_name"].toString().toLowerCase()) {
      //     imageUrl = data[i]["image"];
      //     levelDigimon = data[i]["real_name"];
      //   }
      // }

      print(levelDigimon);
    } catch (exception) {
      print(exception);
    }
  }
}
