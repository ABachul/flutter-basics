import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final String text = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
