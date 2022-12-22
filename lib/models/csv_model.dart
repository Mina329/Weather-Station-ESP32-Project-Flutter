class CSVRowModel {
  final num temp;
  final num humi;
  final num alt;
  final num pres;
  final DateTime? createdAt;

  CSVRowModel({
    required this.temp,
    required this.humi,
    required this.alt,
    required this.pres,
    this.createdAt,
  });

  CSVRowModel copyWith({
    num? temp,
    num? humi,
    num? alt,
    num? pres,
    DateTime? createdAt,
  }) =>
      CSVRowModel(
        temp: temp ?? this.temp,
        humi: humi ?? this.humi,
        alt: alt ?? this.alt,
        pres: pres ?? this.pres,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toJson() => {
        "TEMPERATURE": temp,
        "HUMIDITY": humi,
        "ALTITUDE": alt,
        "PRESSURE": pres,
        "CREATED_AT": createdAt ?? DateTime.now(),
      };

  factory CSVRowModel.fromJson(Map map) => CSVRowModel(
        temp: map['TEMPERATURE'],
        humi: map['HUMIDITY'],
        alt: map['ALTITUDE'],
        pres: map['PRESSURE'],
        createdAt: map['CREATED_AT']?.toDate() ?? DateTime.now(),
      );
}
