import 'package:bookly_app/Features/Home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_texts.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/similer_books_list_view.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBookDetailsAppBar(),
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .30,
            child: CustomBookImage(),
          ),
        ),

        CustomDetailsTextsView(),
        BooksActions(),
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 40),
          child: Text(
            'You can also like',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: SimilerBooksListView(),
        ),
      ],
    );
  }
}
