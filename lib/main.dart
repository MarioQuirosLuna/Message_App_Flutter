import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).theme(),
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text('Message App')
            )
        ),
        body: Center(
          child: FilledButton.tonal(
              onPressed: (){

              },
              child: const Text('Click me')
          )
        )
      )
    );
  }
}
