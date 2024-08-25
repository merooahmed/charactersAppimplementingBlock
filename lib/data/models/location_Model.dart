class LocationModel {
  final String name;
  final String url;
  LocationModel({required this.name, required this.url});
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
