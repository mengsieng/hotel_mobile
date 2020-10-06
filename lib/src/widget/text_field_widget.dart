import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RoundTextField extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final bool readOnly;
  final bool obscureText;
  final TextEditingController controller;

  const RoundTextField({
    Key key,
    this.title = '',
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Expanded(
        child: Container(
          child: TextFormField(
            controller: controller,
            onTap: onTap,
            readOnly: readOnly,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: title.tr(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              suffixIcon: icon == null
                  ? null
                  : Icon(
                      icon,
                    ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'txtValidate'.tr();
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
