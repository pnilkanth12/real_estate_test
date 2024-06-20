import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  final Function(String) onSelected;

  CustomMenu({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.layers),
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'cosy_areas',
          child: ListTile(
            leading: Icon(Icons.local_florist),
            title: Text('Cosy areas'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'price',
          child: ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Price'),
            textColor: Colors.orange,
          ),
        ),
        PopupMenuItem<String>(
          value: 'infrastructure',
          child: ListTile(
            leading: Icon(Icons.domain),
            title: Text('Infrastructure'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'without_any_layer',
          child: ListTile(
            leading: Icon(Icons.layers_clear),
            title: Text('Without any layer'),
          ),
        ),
      ],
    );
  }
}
