import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatefulWidget {
  ReusableCard({
    super.key,
    required this.colour,
    required this.minValue,
    required this.maxValue,
    required this.strVal,
    required this.strlbl,
    required this.minChanged,
    required this.maxChanged,
  });

  final Color colour;

  int minValue;
  int maxValue;
  final String strVal;
  final String strlbl;

  final Function(int) minChanged;
  final Function(int) maxChanged;

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: widget.colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              widget.strVal,
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
                          '${widget.minValue}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          widget.strlbl,
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
                          heroTag: Random.secure().nextDouble().toDouble(),
                          backgroundColor: const Color(0xFF8D8E98),
                          onPressed: () {
                            widget.minValue--;
                            widget.minChanged(widget.minValue);
                          },
                          child: const Icon(FontAwesomeIcons.minus),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        FloatingActionButton(
                          heroTag: Random.secure().nextDouble().toDouble(),
                          backgroundColor: const Color(0xFF8D8E98),
                          onPressed: () {
                            widget.minValue++;
                            widget.minChanged(widget.minValue);
                          },
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
                          '${widget.maxValue}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          widget.strlbl,
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
                          heroTag: Random.secure().nextDouble().toDouble(),
                          backgroundColor: const Color(0xFF8D8E98),
                          onPressed: () {
                            setState(() {
                              widget.maxValue--;
                              widget.maxChanged(widget.maxValue);
                            });
                          },
                          child: const Icon(FontAwesomeIcons.minus),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        FloatingActionButton(
                          heroTag: Random.secure().nextDouble().toDouble(),
                          backgroundColor: const Color(0xFF8D8E98),
                          onPressed: () {
                            widget.maxValue++;
                            widget.maxChanged(widget.maxValue);
                          },
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
