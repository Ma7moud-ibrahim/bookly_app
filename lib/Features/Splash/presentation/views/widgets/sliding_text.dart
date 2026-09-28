import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const new({super.key, required this.slidenAnimation});

  final Animation<Offset> slidenAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidenAnimation,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: slidenAnimation,
          child: Text(
            'Read Free Books',
            style: TextStyle(fontSize: 19),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
