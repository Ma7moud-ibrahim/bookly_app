import 'package:bookly_app/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/model/book_model/volume_info.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem(this.bookModel, {super.key});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouter.kDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 0, bottom: 16, top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: CustomBookImage(
                bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo.title!,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGtSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(height: 8),
                  BookReating(
                    reating: bookModel.volumeInfo.ratingsCount ?? 0,
                    count: bookModel.volumeInfo.averageRating ?? 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
