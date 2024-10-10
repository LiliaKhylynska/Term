import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.child,
  });

  final Widget child;

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
    );
  }
}
