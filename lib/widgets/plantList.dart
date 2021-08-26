import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_disease_app/config/constants.dart';

import 'moreMenu.dart';

class HistoryPlants extends StatefulWidget {
  const HistoryPlants({Key? key, required this.plantList}) : super(key: key);
  final List<PlantView> plantList;

  @override
  _HistoryPlantsState createState() => _HistoryPlantsState();
}

class _HistoryPlantsState extends State<HistoryPlants> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.plantList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemBuilder: (context, index) {
        PlantView _plantCard = widget.plantList[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
          child: Dismissible(
            background: removeWidget(),
            secondaryBackground: addWidget(),
            key: ValueKey(_plantCard),
            child: PlantTile(
              plantCard: _plantCard,
              packed: true,
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                widget.plantList.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  removeWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      alignment: Alignment.centerLeft,
      child: Text(
        'Remove',
        style: TextStyle(
            color: Theme.of(context).colorScheme.onError,
            fontSize: 32,
            fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
          color: Theme.of(context).colorScheme.error),
    );
  }

  addWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      alignment: Alignment.centerRight,
      child: Text(
        'Add',
        style: TextStyle(
            color: Theme.of(context).colorScheme.onError,
            fontSize: 32,
            fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
          color: Theme.of(context).colorScheme.primary),
    );
  }
}

class MyPlants extends StatefulWidget {
  const MyPlants({Key? key, required this.plantList}) : super(key: key);
  final List<PlantView> plantList;

  @override
  _MyPlantsState createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.plantList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemBuilder: (context, index) {
        PlantView _plantCard = widget.plantList[index];
        return ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
            child: PlantTile(plantCard: _plantCard));
      },
    );
  }
}

class PlantTile extends StatelessWidget {
  const PlantTile({Key? key, required PlantView plantCard, this.packed = false})
      : _plantCard = plantCard,
        super(key: key);

  final PlantView _plantCard;
  final bool packed;

  @override
  Widget build(BuildContext context) {
    DateFormat _format = DateFormat.yMMMd();
    return Container(
      padding: EdgeInsets.all(kDefaultPadding * 0.6),
      child: Stack(children: [
        Row(
          children: [
            Container(
              height: this.packed ? 95 : 130, //140
              width: this.packed ? 95 : 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(_plantCard.imageUrl),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: this.packed ? 95 : 130,
              padding: EdgeInsets.symmetric(
                  vertical: this.packed
                      ? kDefaultPadding * 0.1
                      : kDefaultPadding * 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _plantCard.species,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: kDefaultPadding * 0.2,
                        horizontal: kDefaultPadding * 0.5),
                    child: Text(
                      _plantCard.condition,
                      style: TextStyle(
                          fontSize: 12,
                          color: _plantCard.condition == 'Healthy'
                              ? Theme.of(context).accentColor
                              : Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRaduis),
                        color: (_plantCard.condition == 'Healthy'
                                ? Theme.of(context).accentColor
                                : Theme.of(context).colorScheme.error)
                            .withOpacity(0.1)),
                  ),
                  Spacer(),
                  Text(_format.format(_plantCard.date)),
                ],
              ),
            )
          ],
        ),
        this.packed
            ? Center()
            : Positioned(
                right: 0,
                top: kDefaultPadding * 0.3,
                child: MoreMenuBox(
                  options: [
                    MoreItem(text: 'Rename'),
                    MoreItem(
                      text: 'Delete',
                      red: true,
                    )
                  ],
                ))
      ]),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color:
              Theme.of(context).colorScheme.secondaryVariant.withOpacity(0.23),
          blurRadius: 6.0,
        ),
      ], color: Theme.of(context).backgroundColor),
    );
  }
}

class PlantView {
  final String imageUrl;
  final String species;
  final String condition;
  final DateTime date;
  const PlantView(
      {required this.imageUrl,
      required this.species,
      required this.condition,
      required this.date});
}
