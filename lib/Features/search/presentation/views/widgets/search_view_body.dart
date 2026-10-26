import 'package:bookly_app/Features/Home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_feild.dart';
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
              children: [SizedBox(height: 50), CustomSearchTextFeild()],
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
