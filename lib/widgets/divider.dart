import 'dart:math';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Transform.rotate(
        angle: pi / 2,
        child: Divider(
          thickness: 1,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
