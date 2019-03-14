import 'package:flutter/material.dart';

import 'converter_route.dart';
import 'unit.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final IconData iconData;
  final ColorSwatch color;
  final List<Unit> units;

  static const double HEIGHT = 100;
  static const double RADIUS = HEIGHT / 2;

  const CategoryWidget(
      {@required this.name,
      @required this.iconData,
      @required this.color,
      @required this.units});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(RADIUS),
        highlightColor: color,
        splashColor: color,
        onTap: () => _navigateToConverter(context),
        child: Container(
            height: HEIGHT,
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(iconData, size: 60)),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return ConverterRoute(
        units: units,
        name: name,
        color: color,
      );
    }));
  }
}
