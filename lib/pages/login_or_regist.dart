// import 'package:flutter/material.dart';
// import 'package:skinclassifier/pages/login_page.dart';
// import 'package:skinclassifier/pages/signup.dart';

// class LoginOrRegisterPage extends StatefulWidget {
//   const LoginOrRegisterPage({super.key});

//   @override
//   State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
// }

// class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
//   //show login page
//   bool showLoginPage = true;

//   //toggle between login dan reg
//   void togglePages() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginPage(
//         onTap: togglePages,
//       );
//     } else {
//       return SignupPage(
//         onTap: togglePages,
//       );
      
//     }
//   }
// }
