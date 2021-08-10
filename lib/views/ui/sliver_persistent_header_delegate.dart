import 'package:carpooling/src/resources/colors.dart';
import 'package:flutter/material.dart';

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String _title;
  final Color? backgroundColor;

  PersistentHeaderDelegate(this._title, {this.backgroundColor});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(left: 24.0),
      color: Colors.white,
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Text('Dimanche 11 juillet - 15:30',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                        minHeight: 50.0, minWidth: double.infinity),
                    color: Theme.of(context).accentColor,
                    child: Center(
                      child: SizedBox(
                        child: Text(
                          '14 \$',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: AppColors.whiteSmoke,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
