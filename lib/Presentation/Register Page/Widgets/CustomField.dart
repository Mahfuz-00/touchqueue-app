import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CustomOverlay.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hinttext;
  final bool? height;
  final bool? obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? icon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.hinttext,
    this.height,
    this.obscureText,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: height == true
          ? MediaQuery.of(context).size.height * 0.15
          : MediaQuery.of(context).size.height * 0.075,
      child: Stack(
        children: [
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            obscureText: obscureText ?? false,
            readOnly: readOnly,
            style: const TextStyle(
              color: Color.fromRGBO(143, 150, 158, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'default',
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: labelText,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'default',
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              suffixIcon: suffixIcon ??
                  (readOnly
                      ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      icon == 'Date'
                          ? Icons.calendar_today_outlined
                          : icon == 'Clock'
                          ? Icons.alarm_outlined
                          : keyboardType == TextInputType.phone
                          ? Icons.phone
                          : null,
                      size: 25,
                    ),
                  )
                      : null),
              contentPadding: height == true
                  ? EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: MediaQuery.of(context).size.height * 0.18)
                  : null,
              alignLabelWithHint: true,
              isDense: true,
              errorStyle: const TextStyle(
                height: 1,
                fontSize: 10,
              ),
            ),
            onTap: onTap != null
                ? onTap
                : hinttext != null
                ? () {
              showCustomOverlay(context, hinttext!);
            }
                : null,
          ),
          if (onTap != null && readOnly)
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
