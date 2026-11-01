import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage, style: Styles.textStyle18));
  }
}
