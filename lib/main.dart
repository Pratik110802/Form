// ignore_for_file: unnecessary_new
import 'package:form/Validation/signup_validation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignupValidation(),
        ),
        ChangeNotifierProvider<Gendercheck>(
          create: (_) => Gendercheck(),
        ),
        ChangeNotifierProvider<Boolcheck>(
          create: (_) => Boolcheck(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form',
        home: Homepage(),
      ),
    );
  }
}
