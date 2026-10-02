import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class BookReating extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('9.99', style: Styles.textStyle20),
        Row(
          children: [
            const Icon(Icons.star, size: 22, color: Colors.amber),
            const SizedBox(width: 4),
            Text(
              '4.8',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(' (2390)', style: Styles.textStyle14),
          ],
        ),
      ],
    );
  }
}
