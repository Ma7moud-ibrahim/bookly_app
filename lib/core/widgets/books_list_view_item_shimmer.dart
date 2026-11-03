import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BooksListViewShimmer extends StatelessWidget {
  const BooksListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const BooksListViewItemShimmer();
      },
    );
  }
}

class BooksListViewItemShimmer extends StatelessWidget {
  const BooksListViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 16, top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.20,
              child: const AspectRatio(
                aspectRatio: 4.5 / 7,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ShimmerLine(width: double.infinity, height: 20),
                  SizedBox(height: 8),
                  _ShimmerLine(width: 130, height: 20),
                  SizedBox(height: 12),
                  _ShimmerLine(width: 90, height: 16),
                  SizedBox(height: 12),
                  _ShimmerLine(width: 110, height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShimmerLine extends StatelessWidget {
  final double width;
  final double height;

  const _ShimmerLine({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
