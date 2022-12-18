import 'package:esp_app/Component/Constant.dart';
import 'package:flutter/cupertino.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Center(
        child: Text("about"),
      ),
    );
  }
}
