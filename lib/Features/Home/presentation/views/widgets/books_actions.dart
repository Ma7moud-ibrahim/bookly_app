import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              text: '19.99 €',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: Color(0xffEf8262),
              text: 'Free Preview',
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
