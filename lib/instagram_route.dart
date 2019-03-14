import 'package:flutter/material.dart';

class InstagramRoute extends StatelessWidget {
  static const _menuIcons = [
    Icons.home,
    Icons.search,
    Icons.add,
    Icons.favorite_border,
    Icons.people
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: DropdownButton<String>(items: [
            DropdownMenuItem<String>(value: 'sam', child: Text('sam'))
          ], value: 'sam', onChanged: (newValue) {}),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            icon: Icon(Icons.list),
          )
        ],
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: _photoGrid(),
              ),
              BottomNavigationBar(
                items: _menuItems(),
                currentIndex: 0,
              ),
            ],
          )),
    );
  }

  List<BottomNavigationBarItem> _menuItems() {
    final items = <BottomNavigationBarItem>[];

    _menuIcons.forEach((iconData) {
      items.add(BottomNavigationBarItem(
          icon: Icon(
            iconData,
            color: Colors.grey,
          ),
          title: Text('')));
    });

    return items;
  }

  GridView _photoGrid() {
    final gridItems = List.generate(15,
        (index) => Image.asset('images/insta$index.jpg', fit: BoxFit.cover));

    return GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: gridItems);
  }
}
