import 'package:bookly_app/Features/Home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(),
          FeaturedBooksListView(),
          const SizedBox(height: 50),
          Text(
            'Best Seller',
            style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
          ),

          BestSellerListView(),
        ],
      ),
    );
  }
}
