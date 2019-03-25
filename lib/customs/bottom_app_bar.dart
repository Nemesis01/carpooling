import 'package:carpooling/customs/bottom_app_bar_item.dart';
import 'package:carpooling/res/dimens.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  /// FIELDS
  //final int currentIndex;
  final Color color;
  final Color selectedColor;
  final Color backgroundColor;
  final double height;
  final double iconSize;
  final List<BottomAppBarItem> items;
  final ValueChanged<int> onItemSelected;

  /// CONSTRUCTOR(S)
  BottomBar({
    this.color: Colors.black45,
    this.selectedColor: Colors.black87,
    this.backgroundColor,
    this.height: Dimens.BOTTOM_APPBAR_HEIGHT,
    this.iconSize: Dimens.BOTTOM_APPBAR_ICON_SIZE,
    this.items,
    this.onItemSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  @override
  //State<StatefulWidget> createState() => _BottomBarState();
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onItemSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = List.generate(widget.items.length, (int index) {
      return _buildBottomBarItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    _items.insert(_items.length >> 1, _buildMiddleBottomBarItem());

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items,
      ),
    );
  }

  Widget _buildBottomBarItem({
    BottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color itemColor =
        (_selectedIndex == index) ? widget.selectedColor : widget.color;
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
                children: <Widget>[
                  Icon(item.icon, color: itemColor, size: widget.iconSize),
                ],
              )),
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
          children: <Widget>[],
        ),
      ),
    );
  }
}

/*

Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _items[0],
                _items[1],
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _items[2],
                _items[3],
              ],
            ),
          ),

 */
