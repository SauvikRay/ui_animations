import 'package:flutter/material.dart';
import 'package:sauvik_ui/monument/monument.dart';

void main() => runApp(const FlowerApp());

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: MonumentScreen(),
    );
  }
}
