import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:plant_disease_app/widgets/divider.dart';

import 'buttons.dart';
import 'glass.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {Key? key, required this.title, required this.text, required this.child})
      : super(key: key);
  final String title;
  final String text;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 200,
        child: Column(
          children: [
            Glass(
              sigma: 20,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(kDefaultBorderRaduis)),
              child: Container(
                height: 110,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 230,
                      alignment: Alignment.center,
                      child: Text(
                        this.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      this.text,
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(kDefaultBorderRaduis))),
              ),
            ),
            Glass(
                sigma: 6,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(kDefaultBorderRaduis)),
                child: Container(
                    height: 50,
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                    child: this.child,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.7),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(kDefaultBorderRaduis)))))
          ],
        ),
      ),
    );
  }
}

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
        title: this.title,
        text: "You can't undo this action",
        child: Row(
          children: [
            Expanded(
                child: SecondaryButton(
                    text: "Cancel", onPressed: () => Navigator.pop(context))),
            DividerWidget(),
            Expanded(
              child: SecondaryButton(
                text: 'Delete',
                color: Theme.of(context).colorScheme.error,
                onPressed: () {
                  this.onPressed();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
