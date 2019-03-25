import 'package:flutter/material.dart';

class BottomAppBarItem {
  /// FIELDS
  int index;
  IconData icon;

  // bool isSelected;

  /// CONSTRUCTORS
  BottomAppBarItem({
    @required this.icon,
    this.index,
    //this.iconSize: Dimens.BOTTOM_APPBAR_ICON_SIZE,
  });

  //@override
  //_StateBottomBarItem createState() => _StateBottomBarItem();
}

/*class _StateBottomBarItem extends State<BottomBarItem> {
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
}*/
