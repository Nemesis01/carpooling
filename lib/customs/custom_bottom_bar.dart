import 'package:carpooling/customs/bottom_app_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:carpooling/res/dimens.dart';

class CustomBottomBar extends StatefulWidget {
  @required
  final List<BottomAppBarItem> items;
  final ValueChanged<int> onItemSelected;

  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedItemColor;
  final NotchedShape notchedShape;

  ///
  /// CONSTRUCTOR
  ///
  CustomBottomBar({
    this.items,
    this.height: Dimens.BOTTOM_APPBAR_HEIGHT,
    this.iconSize: Dimens.BOTTOM_APPBAR_ICON_SIZE,
    this.backgroundColor,
    this.color,
    this.selectedItemColor,
    this.notchedShape,
    this.onItemSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  @override
  _CustomBottomBarState createState() => new _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildBottomBarItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleBottomBarItem());
    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [],
      ),
    );
  }

  Widget _buildBottomBarItem({
    BottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color =
        _selectedIndex == index ? widget.selectedItemColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.iconData, color: color, size: widget.iconSize),
                  //Text(item.text, )
                ]),
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleBottomBarItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: widget.iconSize),
            Text(''),
          ],
        ),
      ),
    );
  }

  void _updateIndex(int index) {
    widget.onItemSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
