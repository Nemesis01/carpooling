import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget {
  final Widget avatar;
  final Widget title;

  const AnimatedAppBar({this.avatar, this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _AnimatedAppBarDelegate(
        avatar: avatar,
        title: title,
      ),
    );
  }
}

class _AnimatedAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarTween =
      SizeTween(begin: Size(150.0, 150.0), end: Size(24.0, 24.0));
  final _avatarMarginTween =
      EdgeInsetsTween(begin: EdgeInsets.zero, end: EdgeInsets.only(left: 16.0));
  final _avatarAlignTween =
      AlignmentTween(begin: Alignment.topCenter, end: Alignment.centerLeft);

  final _titleTween = SizeTween(end: Size(100, 20));
  final _titleMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 150.0), end: EdgeInsets.only(left: 32.0));
  final _titleAlignTween =
      AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft);

  final Widget avatar;
  final Widget title;

  _AnimatedAppBarDelegate({this.avatar, this.title})
      : assert(avatar != null),
        assert(title != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / 150.0;

    final avatarSize = _avatarTween.lerp(progress);
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);

    final titleSize = _titleTween.lerp(progress);
    final titleMargin = _titleMarginTween.lerp(progress);
    final titleAlign = _titleAlignTween.lerp(progress);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Padding(
          padding: avatarMargin,
          child: Align(
            alignment: avatarAlign,
            child: SizedBox.fromSize(size: avatarSize, child: avatar),
          ),
        ),
        Padding(
          padding: titleMargin,
          child: Align(
            alignment: titleAlign,
            child: DefaultTextStyle(
                style: Theme.of(context).textTheme.title, child: title),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 54.0;

  @override
  bool shouldRebuild(_AnimatedAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }
}
