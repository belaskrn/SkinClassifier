import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinclassifier/models/skinimage_list.dart';
import 'package:skinclassifier/pages/signup.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ImageList(),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(
      ),
    ),
    );
  }
}
