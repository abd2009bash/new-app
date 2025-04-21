import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إدارة الطلاب',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo', // إذا كنت تستخدم خطًا عربيًا
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
