import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listItems = ["Jabłko", "Gruszka"];
  String inputFieldText = "";

  void _addItem() => setState(() {
        listItems.add(inputFieldText);
      });

  _onChanged(String text) {
    inputFieldText = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                onChanged: _onChanged,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 5.0),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    labelText: 'Produkt',
                    hintText: 'Wpisz nazwę produktu...',
                    helperText: 'Po wpisaniu produktu kliknij przycisk +',
                    prefixIcon: Icon(
                      Icons.shopping_cart,
                      //color: Colors.blueAccent,
                    ))),
            Expanded(
                child: ListView.builder(
                    itemCount: listItems.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      final item = listItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: item,
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                    child: Text(
                                  item,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.orange),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                )),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
