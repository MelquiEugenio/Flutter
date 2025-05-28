import 'package:flutter/material.dart';
import 'package:full_app/core/di/global_di.dart';
import 'package:full_app/features/home/presentation/pages/home_page.dart';

void main() {
  GlobalDI.initializeGlobalDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

