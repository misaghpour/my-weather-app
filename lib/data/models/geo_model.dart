class GeoModel {
  final double lat;
  final double lon;
  final bool isValid;
  final String name;
  final String country;

  GeoModel(
      {required this.lat,
      required this.lon,
      required this.name,
      required this.country,
      required this.isValid});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    if (json['lat'] == null) {
      return GeoModel(lat: -1, lon: -1, country: '', name: '', isValid: true);
    } else {
      return GeoModel(
          lat: json['lat'],
          lon: json['lon'],
          country: json['country'],
          name: json['name'],
          isValid: true);
    }
  }

  factory GeoModel.init() {
    return GeoModel(lat: -1, lon: -1, country: '', name: '', isValid: false);
  }
}
