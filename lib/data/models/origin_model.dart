class OriginModel {
  final String? name;
  final String? url;
  OriginModel({
    this.name,
    this.url,
  });
  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
