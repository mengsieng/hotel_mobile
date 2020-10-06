import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextRow extends StatelessWidget {
  final String title;
  final String contant;
  TextRow({this.title, this.contant});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.50),
          width: 120.0,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ).tr(),
        ),
        Text(':'),
        SizedBox(
          width: 10.0,
        ),
        Text(contant),
      ],
    );
  }
}
