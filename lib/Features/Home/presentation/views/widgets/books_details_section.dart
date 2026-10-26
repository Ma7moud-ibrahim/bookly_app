import 'package:bookly_app/Features/Home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_texts.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

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
