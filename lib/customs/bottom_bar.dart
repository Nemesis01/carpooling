import 'package:flutter/material.dart';
import 'package:carpooling/res/dimens.dart';
import 'package:carpooling/customs/bottom_bar_item.dart';

class BottomBar extends StatefulWidget {
  /// FIELDS
  final List<BottomBarItem> items;
  final double height;
  final BottomBarItem selectedItem;

  /// CONSTRUCTOR(S)
  BottomBar({
    @required this.items,
    this.height: Dimens.BOTTOM_APPBAR_HEIGHT,
    this.selectedItem,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  var _items;

  @override
  Widget build(BuildContext context) {

    //_items = List.generate(widget.items.length, generator);
    _items = widget.items;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
        ],
      ),
    );
  }
}

