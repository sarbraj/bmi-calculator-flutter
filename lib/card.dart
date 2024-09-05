import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final VoidCallback? onTapMethod;
  ReusableCard(
      {required this.colour,
      required this.cardChild,
      required this.onTapMethod});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapMethod,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: this.colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
