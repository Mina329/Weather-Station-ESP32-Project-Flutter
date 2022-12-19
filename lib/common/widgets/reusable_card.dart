import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour,
      required this.minValue,
      required this.maxValue,
      required this.strVal,
      required this.strlbl,
      required this.minMinusFunc,
      required this.minPlusFunc,
      required this.maxMinusFunc,
      required this.maxPlusFunc});

  final Color colour;
  int minValue;
  int maxValue;
  String strVal;
  String strlbl;
  VoidCallback minMinusFunc;

  VoidCallback minPlusFunc;

  VoidCallback maxMinusFunc;

  VoidCallback maxPlusFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              strVal,
              style: TextStyle(fontSize: 40, color: Color(0xFF8D8E98)),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Min",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          minValue.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          strlbl,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: const Color(0xFF8D8E98),
                          child: const Icon(FontAwesomeIcons.minus),
                          onPressed: minMinusFunc,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xFF8D8E98),
                          child: const Icon(FontAwesomeIcons.plus),
                          onPressed: minPlusFunc,
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Max",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          maxValue.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          strlbl,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: const Color(0xFF8D8E98),
                          child: const Icon(FontAwesomeIcons.minus),
                          onPressed: maxMinusFunc,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xFF8D8E98),
                          child: const Icon(FontAwesomeIcons.plus),
                          onPressed: maxPlusFunc,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
