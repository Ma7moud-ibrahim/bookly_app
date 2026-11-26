import 'package:bookly_app/Features/Home/presentation/view_model/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
      builder: (context, state) {
        if (state is SimilerBooksSucsses) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomBookImage(
                    state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        state
                            .books[index]
                            .volumeInfo
                            .imageLinks
                            ?.smallThumbnail ??
                        '',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilerBooksFailure) {
          return CustomErrorWidget(state.errorMessage);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
