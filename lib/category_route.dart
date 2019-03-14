import 'package:flutter/material.dart';

import 'category.dart';
import 'unit.dart';

class CategoryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _icons = [
    Icons.navigation,
    Icons.star_border,
    Icons.star,
    Icons.star_half,
    Icons.cake,
    Icons.accessibility,
    Icons.dashboard,
    Icons.zoom_in
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(66, 165, 245, 1.0),
        title: Text('Unit Converter', style: TextStyle(fontSize: 30)),
        elevation: 0.0,
      ),
      body: Container(
          color: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _listView()),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemBuilder: (_, index) => CategoryWidget(
            name: _categoryNames[index],
            iconData: _icons[index],
            color: _baseColors[index],
            units: _retrieveUnitList(_categoryNames[index]),
          ),
      itemCount: _categoryNames.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }
}
