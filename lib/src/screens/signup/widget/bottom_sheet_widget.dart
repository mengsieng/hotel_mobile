import 'package:flutter/material.dart';

void settingModalBottomSheet(context, {Function(String) onChanged}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: ImageIcon(AssetImage('assets/img/gender.png')),
              title: Text('Male'),
              onTap: () {
                onChanged('Male');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: ImageIcon(AssetImage('assets/img/gender.png')),
              title: Text('Female'),
              onTap: () {
                onChanged('Female');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
