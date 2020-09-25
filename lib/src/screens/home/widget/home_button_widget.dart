import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key key,
    this.onTap,
    this.title,
    this.imagePath,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 30;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.28,
        height: 115.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0XFFF3F3F3),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(7.0),
              padding: EdgeInsets.all(20.0),
              width: width * 0.28,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.asset(
                imagePath,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
