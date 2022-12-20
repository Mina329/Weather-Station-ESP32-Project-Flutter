class SettingsModel {
  final int maxTempVal;
  final int maxHumiVal;
  final int maxAltVal;
  final int maxPresVal;
  final int minTempVal;
  final int minHumiVal;
  final int minAltVal;
  final int minPresVal;
  final String email;
  final bool emailSent;

  SettingsModel({
    required this.maxTempVal,
    required this.maxHumiVal,
    required this.maxAltVal,
    required this.maxPresVal,
    required this.minTempVal,
    required this.minHumiVal,
    required this.minAltVal,
    required this.minPresVal,
    required this.email,
    required this.emailSent,
  });

  SettingsModel copyWith({
    int? maxTempVal,
    int? maxHumiVal,
    int? maxAltVal,
    int? maxPresVal,
    int? minTempVal,
    int? minHumiVal,
    int? minAltVal,
    int? minPresVal,
    String? email,
    bool? emailSent,
  }) =>
      SettingsModel(
        maxTempVal: maxTempVal ?? this.maxTempVal,
        maxHumiVal: maxHumiVal ?? this.maxHumiVal,
        maxAltVal: maxAltVal ?? this.maxAltVal,
        maxPresVal: maxPresVal ?? this.maxPresVal,
        minTempVal: minTempVal ?? this.minTempVal,
        minHumiVal: minHumiVal ?? this.minHumiVal,
        minAltVal: minAltVal ?? this.minAltVal,
        minPresVal: minPresVal ?? this.minPresVal,
        email: email ?? this.email,
        emailSent: emailSent ?? this.emailSent,
      );

  Map<dynamic, dynamic> toJson() => {
        "maxTempVal": maxTempVal,
        "maxHumiVal": maxHumiVal,
        "maxAltVal": maxAltVal,
        "maxPresVal": maxPresVal,
        "minTempVal": minTempVal,
        "minHumiVal": minHumiVal,
        "minAltVal": minAltVal,
        "minPresVal": minPresVal,
        "email": email,
        "emailSent": emailSent,
      };

  factory SettingsModel.fromJson(Map<dynamic, dynamic> map) => SettingsModel(
        maxTempVal: map['maxTempVal'],
        maxHumiVal: map['maxHumiVal'],
        maxAltVal: map['maxAltVal'],
        maxPresVal: map['maxPresVal'],
        minTempVal: map['minTempVal'],
        minHumiVal: map['minHumiVal'],
        minAltVal: map['minAltVal'],
        minPresVal: map['minPresVal'],
        email: map['email'],
        emailSent: map['emailSent'],
      );
}
