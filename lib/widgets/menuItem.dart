import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:iconsax/iconsax.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.prefix, required this.text})
      : super(key: key);

  final IconData prefix;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
        onTap: () {},
        child: Container(
          height: 74,
          padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding, horizontal: kDefaultPadding * 0.75),
          child: Row(
            children: [
              Icon(prefix),
              SizedBox(width: 20),
              Text(
                this.text,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Icon(
                Iconsax.arrow_right_3,
                size: 22,
              )
            ],
          ),
        ),
      ),
    );
  }
}
