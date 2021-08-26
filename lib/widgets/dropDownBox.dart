import 'package:flutter/material.dart';

class DropDownBox extends StatefulWidget {
  const DropDownBox({Key? key, required this.button, required this.childWidth})
      : super(key: key);
  final button;
  final double childWidth;

  @override
  DropDownBoxState createState() => DropDownBoxState();
}

class DropDownBoxState<T extends DropDownBox> extends State<T>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController.removeListener(() {
      setState(() {});
    });

    super.dispose();
  }

  late OverlayEntry _overlayEntry;

  Widget buildChildWidget(AnimationController animationController,
      OverlayEntry _overlayEntry, BuildContext context) {
    return Container();
  }

  void _showOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    OverlayState overlayState = Overlay.of(context)!;

    _overlayEntry = OverlayEntry(
        builder: (context) => Stack(children: [
              Positioned.fill(
                  child: GestureDetector(
                      onTap: () async {
                        await animationController.reverse();
                        _overlayEntry.remove();
                      },
                      child: Container(
                        color: Colors.transparent,
                      ))),
              Positioned(
                  left: offset.dx - widget.childWidth + size.width,
                  top: offset.dy + size.height + 10,
                  child: Material(
                      type: MaterialType.transparency,
                      child: FadeTransition(
                        opacity: animation,
                        child: buildChildWidget(
                            animationController, _overlayEntry, context),
                      )))
            ]));
    animationController.addListener(() {
      overlayState.setState(() {});
    });
    animationController.forward();
    overlayState.insert(_overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    widget.button.onTap = () {
      this._showOverlayEntry();
    };
    return widget.button;
  }
}
