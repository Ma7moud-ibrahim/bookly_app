import 'package:bookly_app/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomDetailsTextsView extends StatelessWidget {
  const CustomDetailsTextsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bookModel.volumeInfo.title ?? '',

            style: Styles.textStyle30,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle16,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 22, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                "${bookModel.volumeInfo.averageRating ?? 0}",
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                ' (${bookModel.volumeInfo.ratingsCount ?? 0})',
                style: Styles.textStyle14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
