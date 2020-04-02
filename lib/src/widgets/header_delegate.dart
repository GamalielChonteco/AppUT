import 'package:flutter/material.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minheight;
  final double maxheight;
  final Widget child;

  SliverCustomHeaderDelegate({
    @required this.minheight, 
    @required this.maxheight, 
    @required this.child
  });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand( child: child );
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child     != oldDelegate.child;
  }

}