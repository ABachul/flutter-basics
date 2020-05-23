import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/screens.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>
            HomeScreen(title: 'Flutter basics'), //title: 'Flutter basics'
        DetailsScreen.routeName: (context) => DetailsScreen(),
      },
      // home: HomeScreen(title: 'Flutter basics'),
    );
  }
}
