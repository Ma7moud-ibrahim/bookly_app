import 'package:bookly_app/Features/Home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_feild.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                CustomSearchTextFeild(),
                SizedBox(height: 20),
                Text('Best Seller', style: Styles.textStyle20),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: 7,
            itemBuilder: (context, index) => const BooksListViewItem(),
          ),
        ],
      ),
    );
  }
}
