import 'package:bookly_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_details_texts.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookDetailsAppBar(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .35,
          child: CustomBookImage(),
        ),

        CustomDetailsTextsView(),
      ],
    );
  }
}
