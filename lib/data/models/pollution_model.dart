class PollutionModel {
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final double pm10;
  final double nh3;

  final bool isValid;

  PollutionModel(
      {required this.co,
      required this.no,
      required this.no2,
      required this.o3,
      required this.so2,
      required this.pm2_5,
      required this.pm10,
      required this.nh3,
      required this.isValid});

  factory PollutionModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] == null) {
      return PollutionModel(
          co: -1,
          no: -1,
          no2: -1,
          o3: -1,
          so2: -1,
          pm2_5: -1,
          pm10: -1,
          nh3: -1,
          isValid: false);
    } else {
      final listJson = json['list'];
      final cJson = listJson[0]['components']; // c: Components
      return PollutionModel(
          co: double.parse(cJson['co'].toString()),
          no: double.parse(cJson['no'].toString()),
          no2: double.parse(cJson['no2'].toString()),
          o3: double.parse(cJson['o3'].toString()),
          so2: double.parse(cJson['so2'].toString()),
          pm2_5: double.parse(cJson['pm2_5'].toString()),
          pm10: double.parse(cJson['pm10'].toString()),
          nh3: double.parse(cJson['nh3'].toString()),
          isValid: true);
    }
  }

  factory PollutionModel.init() {
    return PollutionModel(
        co: -1,
        no: -1,
        no2: -1,
        o3: -1,
        so2: -1,
        pm2_5: -1,
        pm10: -1,
        nh3: -1,
        isValid: false);
  }
}
