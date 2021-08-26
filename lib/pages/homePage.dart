import 'package:flutter/material.dart';
import 'package:plant_disease_app/pages/accountPage.dart';
import 'package:plant_disease_app/pages/plantPage.dart';
import 'package:plant_disease_app/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final List pages = [
    Center(child: Text('1')),
    Center(
      child: Text('siofdghfdghsl'),
    ),
    PlantPage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigator(
            onTabChange: (_currentindex) {
              setState(() {
                currentPage = _currentindex;
              });
            },
            tabs: [
              TabButton(
                icon: Iconsax.home,
                text: 'Home',
              ),
              TabButton(
                icon: Iconsax.camera,
                text: 'Camera',
              ),
              TabButton(
                icon: Iconsax.home,
                text: 'My Plants',
              ),
              TabButton(
                icon: Iconsax.profile_circle4,
                text: 'Profile',
              )
            ]));
  }
}
