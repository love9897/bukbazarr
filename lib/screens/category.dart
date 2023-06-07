import 'package:bukbazarr/widgets/categorycardwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: categorycard(),
      ),
    );
  }
}
