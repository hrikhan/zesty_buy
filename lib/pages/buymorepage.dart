import 'package:flutter/material.dart';

class Buymorepage extends StatelessWidget {
  const Buymorepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("all product"),
      ),
      body: Center(
        child: Text('please wait, our product is underway '),
      ),
    );
  }
}
