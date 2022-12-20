import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeamMember {
  final String name;
  final String id;
  final CircleAvatar? image;

  const TeamMember({required this.name, required this.id, this.image});
}
