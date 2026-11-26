import 'package:bookly_app/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presentation/view_model/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    final categories = widget.bookModel.volumeInfo.categories;
    if (categories != null && categories.isNotEmpty) {
      BlocProvider.of<SimilerBooksCubit>(
        context,
      ).featchSimilarBooks(category: categories[0]);
    } else {
      BlocProvider.of<SimilerBooksCubit>(context).featchSimilarBooks(
        category: '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailsViewBody(bookModel: widget.bookModel));
  }
}
