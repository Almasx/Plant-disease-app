import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:plant_disease_app/widgets/dialog.dart';
import 'package:plant_disease_app/widgets/divider.dart';
import 'package:plant_disease_app/widgets/widgets.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({Key? key}) : super(key: key);

  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PlantView> _plantList = [
      PlantView(
          imageUrl: 'assets/images/image_1.jpg',
          species: 'Tomato',
          condition: 'Healthy',
          date: DateTime(2021, 4, 5)),
      ...List.generate(
          10,
          (index) => PlantView(
              imageUrl: 'assets/images/image_2.jpg',
              species: 'Tomato',
              condition: 'Cancer',
              date: DateTime(2020, 12, 1)))
    ];
    return Container(
      padding:
          EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding / 2),
      child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: CustomTabBar(
            tabController: _tabController,
            tabTexts: ['My Plants', 'History'],
          ),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Column(
                children: [
                  Container(
                    height: 54,
                    margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Row(children: [
                      Expanded(
                        child: SearchBar(),
                      ),
                      SizedBox(width: 20),
                      SortMenuBox(options: [
                        SortItem(text: 'Date'),
                        SortItem(text: 'Alphabet')
                      ])
                    ]),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                      child: MyPlants(plantList: _plantList),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Column(
                children: [
                  Container(
                    height: 54,
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    child: Row(children: [
                      Expanded(
                        child: SearchBar(),
                      ),
                      SizedBox(width: 20),
                      SortMenuBox(options: [
                        SortItem(text: 'Latest'),
                        SortItem(text: 'Oldest')
                      ])
                    ]),
                  ),
                  Container(
                      height: 34,
                      margin:
                          EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRaduis),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ButtonWidget(
                                text: Text('Apple',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary)),
                                onPressed: () {},
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonWidget(
                                text: Text('Potato',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary)),
                                onPressed: () {},
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonWidget(
                                text: Text('Tomato',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary)),
                                onPressed: () {},
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              DividerWidget(),
                              ButtonWidget(
                                  text: Text('Clear All',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                  color: Theme.of(context).colorScheme.error,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DeleteDialog(
                                              onPressed: () {
                                                _plantList.clear();
                                              },
                                              title:
                                                  'Do you want to clear history?');
                                        });
                                  })
                            ]),
                      )),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                      child: HistoryPlants(plantList: _plantList),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
