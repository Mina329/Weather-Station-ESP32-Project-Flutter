
import 'package:esp_app/common/common.dart';
import 'package:flutter/material.dart';

class Constants {
  static const primaryColor = Color(0xFF111328);
  static const secondaryColor = Color(0xFF111328);
  static const textColor = Color(0xFF46474c);

  static const List<TeamMember> members = [
    TeamMember(
      name: 'مينا اميل فخري',
      id: '20191700674',
      image: CircleAvatar(
        backgroundImage: AssetImage('images/minaemil.jpg'),
        radius: 50,
      ),
    ),
    TeamMember(
      name: 'مينا سعد الله رزق الله',
      id: '20191700677',
      image: CircleAvatar(
        backgroundImage: AssetImage('images/minasaad.jpg'),
        radius: 50,
      ),
    ),
    TeamMember(
      name: 'مينا جرجس نصيف',
      id: '20191700675',
      image: CircleAvatar(
        backgroundImage: AssetImage('images/minagerges.jpg'),
        radius: 50,
      ),
    ),
    TeamMember(
      name: 'محمود محمد احمد',
      id: '20191700607',
      image: CircleAvatar(
        backgroundImage: AssetImage('images/riko.jpg'),
        radius: 50,
      ),
    ),
  ];
}
