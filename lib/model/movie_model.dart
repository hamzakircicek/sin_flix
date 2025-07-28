import 'dart:convert';

MovieModel MovieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String MovieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  Data data;

  MovieModel({required this.data});

  MovieModel copyWith({Data? data}) => MovieModel(data: data ?? this.data);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      MovieModel(data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"data": data.toJson()};
}

class Data {
  List<Movie> movies;
  Pagination pagination;

  Data({required this.movies, required this.pagination});

  Data copyWith({List<Movie>? movies, Pagination? pagination}) => Data(
    movies: movies ?? this.movies,
    pagination: pagination ?? this.pagination,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Movie {
  String id;
  String movieId;
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbId;
  String type;
  String response;
  List<String> images;
  bool comingSoon;
  bool isFavorite;

  Movie({
    required this.id,
    required this.movieId,
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.response,
    required this.images,
    required this.comingSoon,
    required this.isFavorite,
  });

  Movie copyWith({
    String? id,
    String? movieId,
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? awards,
    String? poster,
    String? metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbId,
    String? type,
    String? response,
    List<String>? images,
    bool? comingSoon,
    bool? isFavorite,
  }) => Movie(
    id: id ?? this.id,
    movieId: movieId ?? this.movieId,
    title: title ?? this.title,
    year: year ?? this.year,
    rated: rated ?? this.rated,
    released: released ?? this.released,
    runtime: runtime ?? this.runtime,
    genre: genre ?? this.genre,
    director: director ?? this.director,
    writer: writer ?? this.writer,
    actors: actors ?? this.actors,
    plot: plot ?? this.plot,
    language: language ?? this.language,
    country: country ?? this.country,
    awards: awards ?? this.awards,
    poster: poster ?? this.poster,
    metascore: metascore ?? this.metascore,
    imdbRating: imdbRating ?? this.imdbRating,
    imdbVotes: imdbVotes ?? this.imdbVotes,
    imdbId: imdbId ?? this.imdbId,
    type: type ?? this.type,
    response: response ?? this.response,
    images: images ?? this.images,
    comingSoon: comingSoon ?? this.comingSoon,
    isFavorite: isFavorite ?? this.isFavorite,
  );

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["_id"],
    movieId: json["id"],
    title: json["Title"],
    year: json["Year"],
    rated: json["Rated"],
    released: json["Released"],
    runtime: json["Runtime"],
    genre: json["Genre"],
    director: json["Director"],
    writer: json["Writer"],
    actors: json["Actors"],
    plot: json["Plot"],
    language: json["Language"],
    country: json["Country"],
    awards: json["Awards"],
    poster: json["Poster"],
    metascore: json["Metascore"],
    imdbRating: json["imdbRating"],
    imdbVotes: json["imdbVotes"],
    imdbId: json["imdbID"],
    type: json["Type"],
    response: json["Response"],
    images: List<String>.from(json["Images"].map((x) => x)),
    comingSoon: json["ComingSoon"],
    isFavorite: json["isFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": movieId,
    "Title": title,
    "Year": year,
    "Rated": rated,
    "Released": released,
    "Runtime": runtime,
    "Genre": genre,
    "Director": director,
    "Writer": writer,
    "Actors": actors,
    "Plot": plot,
    "Language": language,
    "Country": country,
    "Awards": awards,
    "Poster": poster,
    "Metascore": metascore,
    "imdbRating": imdbRating,
    "imdbVotes": imdbVotes,
    "imdbID": imdbId,
    "Type": type,
    "Response": response,
    "Images": List<dynamic>.from(images.map((x) => x)),
    "ComingSoon": comingSoon,
    "isFavorite": isFavorite,
  };
}

class Pagination {
  int totalCount;
  int perPage;
  int maxPage;
  int currentPage;

  Pagination({
    required this.totalCount,
    required this.perPage,
    required this.maxPage,
    required this.currentPage,
  });

  Pagination copyWith({
    int? totalCount,
    int? perPage,
    int? maxPage,
    int? currentPage,
  }) => Pagination(
    totalCount: totalCount ?? this.totalCount,
    perPage: perPage ?? this.perPage,
    maxPage: maxPage ?? this.maxPage,
    currentPage: currentPage ?? this.currentPage,
  );

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalCount: json["totalCount"],
    perPage: json["perPage"],
    maxPage: json["maxPage"],
    currentPage: json["currentPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "perPage": perPage,
    "maxPage": maxPage,
    "currentPage": currentPage,
  };
}
