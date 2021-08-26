import 'package:iconsax/iconsax.dart';

import 'dropDownBox.dart';
import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';

class MoreMenuBox extends DropDownBox {
  MoreMenuBox({
    Key? key,
    required this.options,
  }) : super(key: key, button: MoreButton(), childWidth: 120);
  final List<MoreItem> options;
  final double boxWidth = 120;

  @override
  MoreMenuBoxState createState() => MoreMenuBoxState();
}

class MoreMenuBoxState extends DropDownBoxState<MoreMenuBox> {
  int selectedIndex = 0;
  @override
  Widget buildChildWidget(AnimationController animationController,
      OverlayEntry _overlayEntry, BuildContext context) {
    return Container(
      width: widget.boxWidth,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.options
              .map((_filterItem) => MoreItem(
                    text: _filterItem.text,
                    onPressed: () {},
                    red: _filterItem.red,
                  ))
              .toList()),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Theme.of(context).scaffoldBackgroundColor)
          ],
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis)),
    );
  }
}

class MoreItem extends StatelessWidget {
  const MoreItem({
    Key? key,
    required this.text,
    this.onPressed,
    this.red = false,
  }) : super(key: key);
  final String text;
  final bool red;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
            onTap: () {
              this.onPressed!();
            },
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 0.6,
                    horizontal: kDefaultPadding * 0.6),
                child: Row(
                  children: [
                    Text(
                      this.text,
                      style: TextStyle(
                        color: this.red
                            ? Theme.of(context).errorColor
                            : Theme.of(context).colorScheme.onBackground,
                        fontSize: 16,
                      ),
                    ),
                    Spacer()
                  ],
                ))));
  }
}

//ignore: must_be_immutable
class MoreButton extends StatelessWidget {
  late Function onTap;
  set setonTap(func) {
    this.onTap = func;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 30,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(kDefaultBorderRaduis / 2),
                onTap: () {
                  this.onTap();
                },
                child: Icon(
                  Iconsax.more_24,
                ))));
  }
}
