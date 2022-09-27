import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Widget _child;

  const ListItem(this._child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _child,
    );
  }
}
