import 'package:flutter/material.dart';

import './screens/home_screen.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tablematic',
      home: Home(),
    );
  }
}