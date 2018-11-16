import 'package:flutter/material.dart';

class InfosCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> datas;
  final List<String> rowLabels;

  const InfosCard(this.title, {this.rowLabels, this.datas, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.blue,
      elevation: 0.0,
      //margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon),
                SizedBox(width: 10.0),
                Text(
                  this.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(color: Colors.teal),
                ),
              ],
            ),
            Divider(),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children: _rows(context),
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _rows(BuildContext context) {
    List<TableRow> rows = new List();
    for (var i = 0; i < rowLabels.length; i++) {
      rows.add(TableRow(
        children: [
          Text('${rowLabels[i]}', style: Theme.of(context).textTheme.subhead),
          Text(
            '${datas[i]}',
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.end,
          ),
        ],
      ));
    }
    return rows;
  }
}
