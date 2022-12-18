import 'package:flutter/material.dart';

import 'app_view.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheater Station',
      initialRoute: '/',
      routes: {
        '/': (context) => const AppView(),
      },
    );
  }
}
