import 'dart:convert';
import 'dart:core';

class MovieModel {
  final int? id;
  final int episode_id;
  final String title;
  final String director;
  final String opening_crawl;
  final String producer;
  final String release_date;
  final String url;
  
  MovieModel({
    this.id,
    required this.episode_id,
    required this.title,
    required this.director,
    required this.opening_crawl,
    required this.producer,
    required this.release_date,
    required this.url,
  });


  Map<String, dynamic> toMap() {
    return {
      'episode_id': episode_id,
      'id': episode_id,
      'title': title,
      'director': director,
      'opening_crawl': opening_crawl,
      'producer': producer,
      'release_date': release_date,
      'url': url,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      episode_id: map['episode_id'],
      title: map['title'],
      director: map['director'],
      opening_crawl: map['opening_crawl'],
      producer: map['producer'],
      release_date: map['release_date'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));

  MovieModel copyWith({
    int? episode_id,
    String? title,
    String? director,
    String? opening_crawl,
    String? producer,
    String? release_date,
    String? url,
  }) {
    return MovieModel(
      episode_id: episode_id ?? this.episode_id,
      title: title ?? this.title,
      director: director ?? this.director,
      opening_crawl: opening_crawl ?? this.opening_crawl,
      producer: producer ?? this.producer,
      release_date: release_date ?? this.release_date,
      url: url ?? this.url,
    );
  }

  @override
  String toString() {
    return 'MovieModel(episode_id: $episode_id, title: $title, director: $director, opening_crawl: $opening_crawl, producer: $producer, release_date: $release_date, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieModel &&
      other.episode_id == episode_id &&
      other.title == title &&
      other.director == director &&
      other.opening_crawl == opening_crawl &&
      other.producer == producer &&
      other.release_date == release_date &&
      other.url == url;
  }

  @override
  int get hashCode {
    return episode_id.hashCode ^
      title.hashCode ^
      director.hashCode ^
      opening_crawl.hashCode ^
      producer.hashCode ^
      release_date.hashCode ^
      url.hashCode;
  }

  static String generateCreateTable({ required String name }) {
    return 'CREATE TABLE IF NOT EXISTS favorites(id INTEGER PRIMARY KEY, episode_id INTEGER, title TEXT, director TEXT, producer TEXT, opening_crawl TEXT, release_date TEXT, url TEXT)';
  }
}
