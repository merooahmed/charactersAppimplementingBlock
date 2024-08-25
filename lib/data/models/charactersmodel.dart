import 'package:breakingbadproject/data/models/location_Model.dart';
import 'package:breakingbadproject/data/models/origin_model.dart';

class CharactersModel {
  final String id;
  final String name;
  final String image;
  final String species;
  final String status;

  final String? type;
  final String gender;

  final List<dynamic> episode;
  final String url;

  final String created;
  final LocationModel location;
  final OriginModel origin;
  CharactersModel({
    required this.origin,
    required this.location,
    required this.id,
    required this.name,
    required this.image,
    required this.species,
    required this.status,
    this.type,
    required this.gender,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      origin: OriginModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      id: json['id'].toString(),
      name: json['name'],
      image: json['image'],
      species: json['species'],
      status: json['status'],
      type: json['type'],
      gender: json['gender'],
      episode: json['episode'],
      url: json['url'],
      created: json['created'],
    );
  }
}
