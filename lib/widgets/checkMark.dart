import 'package:flutter/material.dart';
import 'dart:math';

class CheckMark extends StatelessWidget {
  const CheckMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: Container(
        width: 20,
        height: 20,
        child: Transform.rotate(
          angle: -pi / 4,
          child: Icon(
            Icons.check,
            size: 12,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).accentColor),
      ),
    );
  }
}
