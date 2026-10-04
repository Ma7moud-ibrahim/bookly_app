import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomDetailsTextsView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Harry Potter and the Goblet of Fire',
            style: Styles.textStyle30,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text('J.K. Rowling', style: Styles.textStyle16),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
