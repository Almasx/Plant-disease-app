import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);
  final Widget text;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(
            color: (this.color != null)
                ? this.color
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(kDefaultBorderRaduis)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                onTap: () {
                  this.onPressed();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: this.text,
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                ))));
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);
  final String text;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(kDefaultBorderRaduis)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                onTap: () {
                  this.onPressed();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    this.text,
                    style: TextStyle(
                        color: (this.color != null)
                            ? this.color
                            : Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withAlpha(100)),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                ))));
  }
}

// ignore: must_be_immutable
class IconButtonWidget extends StatefulWidget {
  IconButtonWidget({
    Key? key,
    this.onPressed,
    this.color,
    required this.icon,
  }) : super(key: key);
  final Color? color;
  final IconData icon;
  final Function? onPressed;
  late Function onTap;
  set setonTap(func) {
    this.onTap = func;
  }

  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.onPressed != null) {
      widget.onTap = widget.onPressed!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color ?? Theme.of(context).accentColor),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.transparent,
                  customBorder: CircleBorder(),
                  onTap: () {
                    widget.onTap();
                  },
                  child: Icon(
                    widget.icon,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )))),
    );
  }
}
