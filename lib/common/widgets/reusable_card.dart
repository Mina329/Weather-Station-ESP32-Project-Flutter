import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.colour,
    required this.minValue,
    required this.maxValue,
    required this.strVal,
    required this.strlbl,
    required this.minMinusFunc,
    required this.minPlusFunc,
    required this.maxMinusFunc,
    required this.maxPlusFunc,
  });

  final Color colour;
  final int minValue;
  final int maxValue;
  final String strVal;
  final String strlbl;
  final VoidCallback minMinusFunc;

  final VoidCallback minPlusFunc;

  final VoidCallback maxMinusFunc;

  final VoidCallback maxPlusFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              strVal,
              style: const TextStyle(fontSize: 40, color: Color(0xFF8D8E98)),
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
                          style: const TextStyle(
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
                          onPressed: minMinusFunc,
                          child: const Icon(FontAwesomeIcons.minus),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xFF8D8E98),
                          onPressed: minPlusFunc,
                          child: const Icon(FontAwesomeIcons.plus),
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
                          style: const TextStyle(
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
                          onPressed: maxMinusFunc,
                          child: const Icon(FontAwesomeIcons.minus),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xFF8D8E98),
                          onPressed: maxPlusFunc,
                          child: const Icon(FontAwesomeIcons.plus),
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
    );
  }
}
