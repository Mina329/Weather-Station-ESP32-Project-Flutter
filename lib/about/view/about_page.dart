import 'package:flutter/material.dart';

import 'about_view.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static route() =>
      MaterialPageRoute(builder: ((context) => const AboutPage()));

  @override
  Widget build(BuildContext context) {
    return const AboutView();
  }
}
