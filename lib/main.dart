import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _tfController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  final _tfController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste de courses"),
      ),
      body: ListViewCustom(),
    );
  }
}

class ListViewCustom extends StatefulWidget {
  _listViewCustomState createState() => _listViewCustomState();
}

class _listViewCustomState extends State<ListViewCustom> {
  final _tfController = TextEditingController();
  List<ListTileCustom> list = [];

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          TextField(
              controller: _tfController,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 5.0),
                ),
                hintText: 'Nom de produit',
              ),
              onSubmitted: (text) {
                _tfController.clear();
                list.add(ListTileCustom(text));
                setState(() {});
              }),
          Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (BuildContext context, index) {
                    return list[index];
                  }))
        ]),
        floatingActionButton: FloatingActionButton(
            child: Icon(
                Icons.delete,
              ),
              onPressed: () {
                list.clear();
                setState(() {});
              }),
        );
  }
}

class ListTileCustom extends StatefulWidget {
  final String productName;

  ListTileCustom(this.productName);

  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<ListTileCustom> {
  bool inCart = false;

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.productName,
        style: _buildText(),
      ),
      onTap: () {
        inCart ? inCart = false : inCart = true;
        setState(() {});
      },
    );
  }

  TextStyle _buildText() {
    TextStyle style;
    if (inCart) {
      style =
          TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough);
    } else {
      style = TextStyle(
          color: Colors.blue, fontSize: 19, fontWeight: FontWeight.w500);
    }
    return style;
  }
}
