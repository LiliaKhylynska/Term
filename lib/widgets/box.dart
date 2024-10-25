import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.width,
    this.height
  });

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
        color: Color.fromARGB(255, 239, 238, 242),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 179, 207, 213),
              blurRadius: 0.0,
              offset: Offset(2, 2))
        ],
      ),
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: child,
    );
  }
}
