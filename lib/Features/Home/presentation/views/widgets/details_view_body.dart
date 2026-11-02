import 'package:bookly_app/Features/Home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/not_strecth_scroll_bahavior.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/similer_books_list_view.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoStretchScrollBehavior(),
      child: CustomScrollView(
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: SimilerBooksListView(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
