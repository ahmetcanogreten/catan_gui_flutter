import 'package:catan_gui_flutter/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CatanApp());
}

class CatanApp extends StatefulWidget {
  const CatanApp({super.key});

  @override
  State<CatanApp> createState() => _CatanAppState();
}

class _CatanAppState extends State<CatanApp> {
  @override
  void initState() {
    super.initState();

    registerBlocs();
  }

  void registerBlocs() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
