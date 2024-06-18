import 'package:flutter/material.dart';

class Cust_text extends StatelessWidget {
  Cust_text({
    super.key,
    required this.TeStyle,
    required this.TextT,
    this.textAlign,
    this.MaxLins,
    this.overflow,
    this.color,
  });
  final TextStyle TeStyle;
  final String TextT;
  final TextAlign? textAlign;
  final int? MaxLins;
  final TextOverflow? overflow;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(TextT,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: MaxLins ?? null,
        overflow: overflow ?? null,
        style: TeStyle.copyWith(color: color ?? null));
  }
}
