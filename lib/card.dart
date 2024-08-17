import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  ReusableCard({required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: this.colour, borderRadius: BorderRadius.circular(10)),
    );
  }
}
