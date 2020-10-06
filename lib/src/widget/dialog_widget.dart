import 'package:flutter/material.dart';

class Dialog extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return _showDialog(context) as Widget;
  }

  _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text("Material Dialog"),
        content: new Text("Hey! I'm Coflutter!"),
        actions: <Widget>[
          FlatButton(
            child: Text('Close me!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
