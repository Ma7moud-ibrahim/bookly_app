import 'package:bookly_app/Features/Home/presentation/view_model/featured_cubit/featured_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_circle_progress.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeathuredCubitState>(
      builder: (context, state) {
        if (state is FeathuredCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomBookImage(
                    state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is FeathuredCubitFailure) {
          return CustomErrorWidget(state.errorMessage);
        } else {
          return Customcircleprogress();
        }
      },
    );
  }
}
