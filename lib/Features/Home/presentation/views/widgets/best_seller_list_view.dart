import 'package:bookly_app/Features/Home/presentation/view_model/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/core/widgets/books_list_view_item_shimmer.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSucsses) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BooksListViewItem(state.books[index]);
            },
          );
        } else if (state is NewsetBooksFailure) {
          return Center(child: CustomErrorWidget(state.errorMessage));
        } else {
          return BooksListViewShimmer();
        }
      },
    );
  }
}
