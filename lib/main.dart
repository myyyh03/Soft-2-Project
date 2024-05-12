import 'package:flutter/material.dart';
import 'package:shopping_app/screens/HomeScreen.dart';

import 'register_page.dart';

void main() {
  runApp( MyApp());
}
 class  MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}