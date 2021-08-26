import 'dart:math' show pow;
import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator(
      {Key? key, this.selectedIndex = 0, this.onTabChange, required this.tabs})
      : super(key: key);

  final int selectedIndex;
  final ValueChanged<int>? onTabChange;
  final List<TabButton> tabs;

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  late int selectedIndex;
  bool clickable = true;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(BottomNavigator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            color: Theme.of(context).backgroundColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.tabs
                    .map((tab) => TabButton(
                          activeColor: Theme.of(context).accentColor,
                          color:
                              Theme.of(context).accentColor.withOpacity(0.10),
                          active: selectedIndex == widget.tabs.indexOf(tab),
                          text: tab.text,
                          icon: tab.icon,
                          onPressed: () {
                            if (!clickable) return;
                            setState(() {
                              selectedIndex = widget.tabs.indexOf(tab);
                              clickable = false;
                            });

                            tab.onPressed?.call();
                            widget.onTabChange?.call(selectedIndex);

                            Future.delayed(Duration(milliseconds: 400), () {
                              setState(() {
                                clickable = true;
                              });
                            });
                          },
                        ))
                    .toList())));
  }
}

class TabButton extends StatefulWidget {
  const TabButton(
      {Key? key,
      this.color,
      required this.icon,
      required this.text,
      this.activeColor,
      this.onPressed,
      this.active})
      : super(key: key);

  final IconData icon;
  final String text;
  final Color? color;
  final Color? activeColor;
  final bool? active;
  final VoidCallback? onPressed;

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> with TickerProviderStateMixin {
  late bool _expanded;
  late final AnimationController expandController;

  @override
  void initState() {
    super.initState();
    _expanded = widget.active!;

    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400))
          ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var curveValue = expandController
        .drive(CurveTween(
            curve: _expanded ? Curves.easeInCubic : Curves.easeInCubic.flipped))
        .value;
    var _colorTween = ColorTween(
        begin: Theme.of(context).iconTheme.color, end: widget.activeColor);
    var _colorTweenAnimation = _colorTween.animate(CurvedAnimation(
        parent: expandController,
        curve: _expanded ? Curves.easeInExpo : Curves.easeOutCirc));

    _expanded = !widget.active!;
    if (_expanded)
      expandController.reverse();
    else
      expandController.forward();

    Widget icon = Icon(widget.icon, color: _colorTweenAnimation.value);

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2, vertical: kDefaultPadding * 0.4),
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: _expanded ? widget.color!.withOpacity(0) : widget.color,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Builder(builder: (_) {
              return Stack(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Opacity(
                      opacity: 0,
                      child: icon,
                    ),
                    Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          widthFactor: curveValue,
                          child: Container(
                            child: Opacity(
                                opacity: _expanded
                                    ? pow(expandController.value, 13) as double
                                    : expandController
                                        .drive(CurveTween(curve: Curves.easeIn))
                                        .value,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16 -
                                          (8 *
                                              expandController
                                                  .drive(CurveTween(
                                                      curve:
                                                          Curves.easeOutSine))
                                                  .value),
                                      right: 8 *
                                          expandController
                                              .drive(CurveTween(
                                                  curve: Curves.easeOutSine))
                                              .value),
                                  child: Text(
                                    widget.text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: widget.activeColor,
                                    ),
                                  ),
                                )),
                          )),
                    ),
                  ]),
                  Align(alignment: Alignment.centerLeft, child: icon),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
