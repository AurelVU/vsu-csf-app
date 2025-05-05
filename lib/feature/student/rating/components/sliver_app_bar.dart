
import 'package:flutter/material.dart';

class RatingSliverAppBar extends StatelessWidget {
  const RatingSliverAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 50 + 33 ,

        maxHeight: 220,

        child:    Column(
          children: [
            const SizedBox(
              height: 33,
            ),
            Expanded(
                child: Container(
                  color: Colors.red,
                )),
            Expanded(
                child: Container(
                  color: Colors.yellow,
                )),
            Expanded(
                child: Container(
                  color: Colors.pink,
                )),
          ],
        ),


      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    print(shrinkOffset);
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: maxExtent),
      child: Stack(
        children: [
          child,
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
