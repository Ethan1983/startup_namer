import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

class ConverterRoute extends StatefulWidget {
  final List<Unit> units;
  final String name;
  final ColorSwatch color;

  const ConverterRoute({
    @required this.units,
    @required this.name,
    @required this.color,
  })  : assert(units != null),
        assert(name != null),
        assert(color != null);

  @override
  State<StatefulWidget> createState() =>
      ConverterRouteState(units: units, name: name, color: color);
}

class ConverterRouteState extends State<ConverterRoute> {
  /// Units for this [Category].
  final List<Unit> units;
  final String name;
  final ColorSwatch color;

  ConverterRouteState({
    @required this.units,
    @required this.name,
    @required this.color,
  })  : assert(units != null),
        assert(name != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = units.map((Unit unit) {
      return Container(
        color: color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(name),
      ),
      body: ListView(
        children: unitWidgets,
      ),
    );
  }
}
