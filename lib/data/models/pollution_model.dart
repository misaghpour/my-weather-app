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
          co: cJson['co'],
          no: cJson['no'],
          no2: cJson['no2'],
          o3: cJson['o3'],
          so2: cJson['so2'],
          pm2_5: cJson['pm2_5'],
          pm10: cJson['pm10'],
          nh3: cJson['nh3'],
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
