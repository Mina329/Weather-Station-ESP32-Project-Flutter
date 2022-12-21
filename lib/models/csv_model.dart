class CSVModel {
  final String temp;
  final String humi;
  final String alt;
  final String pres;

  CSVModel({
    required this.temp,
    required this.humi,
    required this.alt,
    required this.pres,
  });

  CSVModel copyWith({
    String? temp,
    String? humi,
    String? alt,
    String? pres,
  }) =>
      CSVModel(
        temp: temp ?? this.temp,
        humi: humi ?? this.humi,
        alt:  alt ?? this.alt,
        pres: pres ?? this.pres,
      );

  Map<dynamic, dynamic> toJson() => {
    "TEMPERATURE": temp,
    "HUMIDITY": humi,
    "ALTITUDE": alt,
    "PRESSURE": pres,
  };

  factory CSVModel.fromJson(Map<dynamic, dynamic> map) => CSVModel(
    temp: map['TEMPERATURE'],
    humi: map['HUMIDITY'],
    alt: map['ALTITUDE'],
    pres: map['PRESSURE'],
  );
}
