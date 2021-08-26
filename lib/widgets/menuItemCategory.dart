import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:iconsax/iconsax.dart';

class MenuItemCategory extends StatefulWidget {
  const MenuItemCategory(
      {Key? key,
      required this.prefix,
      required this.text,
      required this.subitems})
      : super(key: key);

  final IconData prefix;
  final String text;
  final List<SubMenuItem> subitems;

  @override
  _MenuItemCategoryState createState() => _MenuItemCategoryState();
}

class _MenuItemCategoryState extends State<MenuItemCategory>
    with TickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 400),
      height: (_expanded ? widget.subitems.length * 74 : 0) + 74,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis)),
      child: Stack(children: [
        AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            child: Column(
              children: [...widget.subitems],
            ),
            top: _expanded ? 74 : 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
            color: Theme.of(context).backgroundColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                  _expanded
                      ? animationController.forward()
                      : animationController.reverse();
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                    horizontal: kDefaultPadding * 0.75),
                child: Row(
                  children: [
                    RotationTransition(
                        turns: Tween(begin: 0.0, end: 0.25)
                            .animate(CurvedAnimation(
                          parent: animationController,
                          curve: Curves.easeOut,
                        )),
                        child: Icon(widget.prefix)),
                    SizedBox(width: 20),
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    RotationTransition(
                        turns:
                            Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
                          parent: animationController,
                          curve: Curves.easeOut,
                        )),
                        child: Icon(
                          Iconsax.arrow_down_1,
                          size: 22,
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class SubMenuItem extends StatelessWidget {
  const SubMenuItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.endWidget,
  }) : super(key: key);

  final Widget endWidget;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: MediaQuery.of(context).size.width - kDefaultPadding,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultBorderRaduis)),
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding * 0.75),
              child: Row(
                children: [
                  Icon(this.icon),
                  SizedBox(width: 20),
                  Text(
                    this.text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  this.endWidget,
                ],
              )),
        ),
      ),
    );
  }
}
