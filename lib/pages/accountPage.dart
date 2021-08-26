import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:plant_disease_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:plant_disease_app/config/themes/theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: kDefaultPadding / 2,
          top: kDefaultPadding,
          left: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2),
      child: Column(
        children: [
          profileInfo(context),
          SizedBox(height: 30),
          profileMenuItems(context),
        ],
      ),
    );
  }

  Container profileInfo(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80, //140
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 5,
                color: Colors.transparent,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/pfp_1.jpg'),
              ),
            ),
          ),
          SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Expanded(
            child: Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  Text('Saparov Almas',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.all(kDefaultPadding * 0.5),
                    child: Icon(Icons.logout)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container profileMenuItems(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
          color: Theme.of(context).backgroundColor,
        ),
        child: Column(
          children: [
            MenuItem(
              prefix: Iconsax.profile_circle4,
              text: 'Profile',
            ),
            MenuItemCategory(
              subitems: [
                SubMenuItem(
                  icon: Iconsax.sun_1,
                  text: 'Light Mode / Dark mode',
                  endWidget: ToggleThemeSwitcher(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          final provider = Provider.of<ThemeProvider>(context,
                              listen: false);
                          provider.toggleTheme(value);
                        });
                      }),
                ),
                SubMenuItem(
                  icon: Iconsax.language_circle,
                  text: 'Languages',
                  endWidget: Container(
                    child: Text('English',
                        style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 16,
                        )),
                  ),
                ),
              ],
              prefix: Iconsax.setting_2,
              text: 'General Settings',
            )
          ],
        ));
  }
}
