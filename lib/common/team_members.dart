import 'package:flutter/widgets.dart';

class TeamMember {
  final String name;
  final String id;
  final Image? image;

  TeamMember({required this.name, required this.id, this.image});
}
