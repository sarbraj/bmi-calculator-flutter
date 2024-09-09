import 'package:flutter/cupertino.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTapMethod;
  final String text;

  const BottomButton({required this.onTapMethod, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapMethod,
      child: Container(
        child: Text(
          this.text,
          style: TextStyle(fontSize: 20),
        ),
        alignment: Alignment.center,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
