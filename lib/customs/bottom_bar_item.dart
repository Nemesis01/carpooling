import 'package:flutter/material.dart';
import 'package:carpooling/res/dimens.dart';

class BottomBarItem extends StatefulWidget {
  /// FIELDS
  final int index;
  final Icon icon;
  final Widget activeIcon;
  final Color backgroundColor;
  final double iconSize;

  // bool isSelected;

  /// CONSTRUCTORS
  BottomBarItem({
    @required this.icon,
    this.activeIcon,
    this.backgroundColor,
    this.index,
    this.iconSize: Dimens.BOTTOM_APPBAR_ICON_SIZE,
  });

  @override
  _StateBottomBarItem createState() => _StateBottomBarItem();
}

class _StateBottomBarItem extends State<BottomBarItem> {
  int _index;

  @override
  Widget build(BuildContext context) {
    _index = widget.index;
    return IconButton(
      icon: widget.icon,
      disabledColor: Colors.black54,
      onPressed: () {
        print('BottomBarButton $_index is pressed');
      },
    );
  }

  _setSelected() {
    setState(() {
      //widget.icon.color = Theme.of(context).primaryColor;
    });
  }
}
