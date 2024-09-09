import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressMethod;
  final IconData child;

  const RoundIconButton({required this.child, required this.onPressMethod});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      onPressed: onPressMethod,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      child: Icon(child),
    );
  }
}
