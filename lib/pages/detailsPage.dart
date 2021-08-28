import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:plant_disease_app/widgets/customTabBar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
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
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    expandedHeight: 220,
                    flexibleSpace: FlexibleSpaceBar(
                        title: Text('Goa', textScaleFactor: 1),
                        background: Image.asset(
                          'assets/images/image_1.jpg',
                          fit: BoxFit.fill,
                        ))),
                SliverPersistentHeader(
                    delegate: SliverHeaderDelegate(CustomTabBar(
                  tabController: _tabController,
                  tabTexts: ['My Plants', 'History'],
                )))
              ];
            },
            body: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                  color: Colors.red),
              child: Column(
                children: [Text('stgsf')],
              ),
            )));
  }
}

// Container(
//           padding: EdgeInsets.only(
//               right: kDefaultPadding / 2,
//               top: kDefaultPadding,
//               left: kDefaultPadding / 2,
//               bottom: kDefaultPadding / 2),
//           child: Column(
//             children: [],
//           )),

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate(this._tabBar);

  final _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return false;
  }
}
