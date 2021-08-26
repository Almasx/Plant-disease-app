import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/constants.dart';
import 'package:plant_disease_app/widgets/buttonwidget.dart';
import 'package:plant_disease_app/widgets/textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 340,
        height: 415,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 395,
              width: 340,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.23),
                    blurRadius: 30, // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextFieldWidget(
                      icon: Icons.person,
                      hint: 'Enter you Username',
                      label: 'Username',
                      inputType: TextInputType.name),
                  TextFieldWidget(
                      icon: Icons.email,
                      hint: 'Enter you email',
                      label: 'Email',
                      inputType: TextInputType.emailAddress),
                  TextFieldWidget(
                    icon: Icons.password,
                    hint: 'Enter you password',
                    label: 'Password',
                    secure: true,
                  ),
                  Row(children: [
                    Expanded(
                        child: Divider(
                      color: Colors.black54,
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("or"),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black54,
                    )),
                  ]),
                  Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: TextButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(200, 50)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                kPrimaryLightColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultPadding))),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.grey.withOpacity(0.23))),
                        onPressed: () {},
                        child: Text(
                          'Sign up with google',
                          style: TextStyle(color: Colors.black54),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an Account ? "),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: kBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              width: 340,
              bottom: 0,
              child: Center(
                child: ButtonWidget(
                  text: 'Sign Up',
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
