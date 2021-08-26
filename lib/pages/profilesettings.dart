import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:plant_disease_app/widgets/textfield.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                    width: 130,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        Container(
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
                        Positioned(
                            right: 0,
                            bottom: -10,
                            child: Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.white,
                                    )),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    color: Colors.white,
                                    iconSize: 24,
                                    icon: Icon(Iconsax.camera),
                                    onPressed: () {})))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    hint: 'Change you username',
                    label: 'Username',
                    icon: Iconsax.user,
                  ),
                  TextFieldWidget(
                    hint: 'Change you email',
                    label: 'Email',
                    icon: Iconsax.user,
                  )
                ],
              ),
            )
          ])),
    );
  }
}
