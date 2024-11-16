import 'package:dio/dio.dart';

class OmdbService {
  final Dio _dio = Dio();  
  /* loaded black screen - I thought the issue was with HTML so i switched to dio
  only to find the app runs in an iphone 16 & Ipad simulator, but not macOS
  find out why */

  /* I cannot get the .env file to work, i have watched a few videos and 
  checked stack overflow. I understand why it is necessary to use a .env
  to store sensitive data (in this case the API key) but i've had to
  hardcode it because otherwise my project won't run - sorry not best practice i know */
  final String apiKey = "c3fea1ad";

  /* API call using Dio - again this was an attempt to get 
  around what i thought was an issue with HTTP.
  Tried turning of vpn etc first this was a last resort */
  Future<List<Movie>> searchMovies(String query) async {
    try { // try catch error handling
      final response = await _dio.get( // get request to OMDB API
        'https://www.omdbapi.com/',
        queryParameters: {
          's': query, // movie title search query
          'apikey': apiKey, 
        },
      );

      if (response.statusCode == 200 && response.data['Search'] != null) {
        return (response.data['Search'] as List).map((item) => Movie.fromJson(item)).toList();
      }
    } catch (e) {
      // print("Error: e"); - this was from the issues i faced with
      // the MacOS and was no longer necessary when using xcode simulator
    }
    return []; // return empty list if there are no results 
  }
}

class Movie {
  final String title;
  final String year;
  final String poster;

  Movie({required this.title, required this.year, required this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
    );
  }
}
