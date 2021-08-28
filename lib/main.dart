import 'package:flutter/material.dart';
import 'package:plant_disease_app/config/themes/theme.dart';
import 'package:plant_disease_app/pages/detailsPage.dart';
import 'package:plant_disease_app/pages/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'PlantAi',
              themeMode: themeProvider.themeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              home: DetailsPage(),
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case HomePage.route:
                    return MaterialPageRoute(builder: (_) => HomePage());
                  // case DetailsPage.route:
                  //   return MaterialPageRoute(builder: (_) => DetailsPage());
                  //     // default:
                  //     //   return MaterialPageRoute(builder: (_) => LoginScreen());
                }
              });
        });
  }
}


// Container(
//                   padding: EdgeInsets.all(20),
//                   child: Container(
//                     child: Column(
//                       children: [NewWidget()],
//                     ),
//                   ))
// class NewWidget extends StatefulWidget {
//   // const NewWidget({ Key? key }) : super(key: key);
//   @override
//   _NewWidgetState createState() => _NewWidgetState();
// }

// class _NewWidgetState extends State<NewWidget> {
//   bool _expanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 400),
//       height: _expanded ? 200 : 100,
//       width: 200,
//       child: Stack(
//         children: [
//           Container(
//             width: 200,
//             height: 100,
//             color: Colors.amber,
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     _expanded = !_expanded;
//                     print(1);
//                   });
//                   ;
//                 },
//                 child: Center(
//                   child: Text('bruh'),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 100,
//             child: Container(
//               width: 200,
//               height: 100,
//               color: Colors.amber[400],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
