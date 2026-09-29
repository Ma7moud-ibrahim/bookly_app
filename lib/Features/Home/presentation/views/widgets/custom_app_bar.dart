import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 20, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsDate.logo),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 33, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
