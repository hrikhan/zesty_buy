import 'package:flutter/material.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("product deails"),),
      
      body: Center(
        
        child: CircularProgressIndicator(),
      ),
    );
  }
}
