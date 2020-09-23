import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/provider/home_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('home').tr(),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              // await http.getData();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
          ),
        ],
        currentIndex: homeProvider.navIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          homeProvider.navIndex = value;
          print(value);
        },
      ),
    );
  }
}
