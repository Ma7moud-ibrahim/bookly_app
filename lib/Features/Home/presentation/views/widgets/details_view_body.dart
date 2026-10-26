import 'package:bookly_app/Features/Home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_texts.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/similer_books_list_view.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBookDetailsAppBar(),
              const BookDetailsSection(),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40),
                child: Text(
                  'You can also like',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: SimilerBooksListView(),
          ),
        ),
      ],
    );
  }
}

class BookDetailsSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .30,
            child: CustomBookImage(),
          ),
        ),
        CustomDetailsTextsView(),
        SizedBox(height: 15),
        BooksActions(),
      ],
    );
  }
}
