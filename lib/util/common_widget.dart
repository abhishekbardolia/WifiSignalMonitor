import 'package:flutter/cupertino.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key,required this.text,required this.color,required this.fontWeight});
  final String text;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight
      ),
    );
  }
}
