import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final String text;
  const ErrorWidgetCustom({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          height: 200,
          "assets/undraw_warning_re_eoyh.svg",
          semanticsLabel: 'Acme Logo',
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 25),
        )
      ],
    );
  }
}
