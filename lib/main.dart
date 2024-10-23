import 'package:flutter/material.dart';
import 'package:intern_tz_project/view/main_screen.dart';
import 'package:intern_tz_project/view/state/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => AppState(),
        child: const MainScreen(),
      ),
    );
  }
}
