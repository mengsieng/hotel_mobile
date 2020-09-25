import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LongRaisedButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color backgroundColors;
  final Color textColor;
  const LongRaisedButton({
    Key key,
    this.title,
    this.onTap,
    this.backgroundColors,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: backgroundColors == null
            ? Theme.of(context).primaryColor
            : backgroundColors,
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        ).tr(),
      ),
    );
  }
}
