import 'package:flutter/material.dart';

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  int index = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      final Color color = Colors.primaries[index];
      final double percentage =
          (constraints.maxHeight - minExtent) / (maxExtent - minExtent);

      if (++index > Colors.primaries.length - 1) index = 0;

      return Container(
        decoration: BoxDecoration(boxShadow: [
          const BoxShadow(blurRadius: 4.0, color: Colors.black45)
        ], gradient: LinearGradient(colors: [Colors.blue, color])),
        height: constraints.maxHeight,
        child: SafeArea(
            child: Center(
          child: CircularProgressIndicator(
            value: percentage,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )),
      );
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 250.0;

  @override
  double get minExtent => 80.0;
}
