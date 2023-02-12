class GeoModel {
  final double lat;
  final double lon;
  final bool isValid;

  GeoModel({required this.lat, required this.lon, required this.isValid});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    if (json['lat'] == null) {
      return GeoModel(lat: -1, lon: -1, isValid: true);
    } else {
      return GeoModel(lat: json['lat'], lon: json['lon'], isValid: true);
    }
  }

  factory GeoModel.init() {
    return GeoModel(lat: -1, lon: -1, isValid: false);
  }
}
