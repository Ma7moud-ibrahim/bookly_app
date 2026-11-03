import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class BookReating extends StatelessWidget {
  const BookReating({required this.reating, required this.count, super.key});
  final int reating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Free', style: Styles.textStyle20),
        Row(
          children: [
            const Icon(Icons.star, size: 22, color: Colors.amber),
            const SizedBox(width: 4),
            Text(
              "$reating",

              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(' ($count)', style: Styles.textStyle14),
          ],
        ),
      ],
    );
  }
}
