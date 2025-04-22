import 'package:flutter/material.dart';

class CustomDashboardText extends StatefulWidget {
  const CustomDashboardText(
      {super.key, required this.keyWord, required this.value});
  final String keyWord, value;
  @override
  State<CustomDashboardText> createState() => _CustomDashboardTextState();
}

class _CustomDashboardTextState extends State<CustomDashboardText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "${widget.keyWord} :",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Text(widget.value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
