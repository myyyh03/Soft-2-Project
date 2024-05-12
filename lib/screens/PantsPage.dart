import 'package:flutter/material.dart';

class PantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pants Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('This is the Pants Page'),
      ),
    );
  }
}
