import 'package:flutter/material.dart';

class DonutChart extends StatefulWidget{

  ///
  ///
  ///
  final String rate;
  final double score;
  final double size;
  final List<Colors> sectionColors = new List(3);


  ///
  ///
  ///
  DonutChart(this.size, {this.score, this.rate});


  @override
  _DonutChartState createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart>{

  @override
  Widget build(BuildContext context){

  }
}