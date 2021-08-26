import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_disease_app/config/constants.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis * 2),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search", prefixIcon: Icon(Iconsax.search_normal4)),
      ),
    );
  }
}
