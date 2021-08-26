import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ToggleThemeSwitcher extends StatefulWidget {
  const ToggleThemeSwitcher(
      {Key? key, required this.onChanged, required this.value})
      : super(key: key);
  final Function(bool) onChanged;
  final value;

  @override
  _ToggleThemeSwitcherState createState() => _ToggleThemeSwitcherState();
}

class _ToggleThemeSwitcherState extends State<ToggleThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      child: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          activeColor: Theme.of(context).colorScheme.primary,
          value: widget.value,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
