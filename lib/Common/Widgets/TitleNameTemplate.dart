import 'package:flutter/material.dart';

class TitleNameWidget extends StatelessWidget {
  final String title;
  final String name;

  const TitleNameWidget({
    Key? key,
    required this.title,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            ':', // Middle colon
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16,
            ),
            maxLines: null,
          ),
        ),
      ],
    );
  }
}
