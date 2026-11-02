import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomBookImage(
                "http://books.google.com/books/content?id=s-IH_x6ytuQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
              ),
            );
          },
        ),
      ),
    );
  }
}
