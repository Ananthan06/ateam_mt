import 'package:flutter/material.dart';
import 'package:flutter_app_mt/providers/product_provider.dart';
import 'package:flutter_app_mt/providers/ui_provider.dart';
import 'package:flutter_app_mt/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        ChangeNotifierProvider<UiProvider>(
            create: (_) => UiProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Home'),
      ),
    );
  }
}
