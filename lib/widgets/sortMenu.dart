import 'buttons.dart';
import 'checkMark.dart';
import 'dropDownBox.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';

class SortMenuBox extends DropDownBox {
  SortMenuBox({
    Key? key,
    required this.options,
  }) : super(
            key: key,
            button: IconButtonWidget(icon: Iconsax.sort),
            childWidth: 180);
  final List<SortItem> options;
  final double boxWidth = 180;

  @override
  SortMenuBoxState createState() => SortMenuBoxState();
}

class SortMenuBoxState extends DropDownBoxState<SortMenuBox> {
  int selectedIndex = 0;
  @override
  Widget buildChildWidget(AnimationController animationController,
      OverlayEntry _overlayEntry, BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: widget.boxWidth,
          padding: EdgeInsets.only(bottom: kDefaultPadding / 2),
          child: Column(
              children: widget.options
                  .map((_filterItem) => SortItem(
                      text: _filterItem.text,
                      active:
                          selectedIndex == widget.options.indexOf(_filterItem),
                      onPressed: () async {
                        selectedIndex = widget.options.indexOf(_filterItem);
                        debugPrint(selectedIndex.toString());
                        await animationController.reverse();
                        _overlayEntry.remove();
                      }))
                  .toList()),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Theme.of(context).scaffoldBackgroundColor)
              ],
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRaduis)),
        ),
        Positioned(
            bottom: -18,
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 0.3,
                    horizontal: kDefaultPadding * 0.8),
                child: Center(
                  child: Text(
                    'Sort by:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(kDefaultBorderRaduis))))
      ],
    );
  }
}

class SortItem extends StatelessWidget {
  const SortItem(
      {Key? key, required this.text, this.onPressed, this.active = false})
      : super(key: key);
  final String text;
  final bool active;
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
                    vertical: kDefaultPadding * 0.75,
                    horizontal: kDefaultPadding * 0.5),
                child: Row(children: [
                  this.active
                      ? CheckMark()
                      : SizedBox(
                          width: 20,
                        ),
                  SizedBox(width: 10),
                  Text(
                    this.text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Spacer()
                ]))));
  }
}
