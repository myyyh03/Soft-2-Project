import 'package:flutter/material.dart';

class ShirtsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shirts Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('This is the Shirts Page'),
      ),
    );
  }
}
