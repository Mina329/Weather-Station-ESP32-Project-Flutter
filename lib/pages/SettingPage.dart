import 'package:flutter/cupertino.dart';

import '../Component/Constant.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Center(
        child: Text("setting"),
      ),
    );
  }
}
