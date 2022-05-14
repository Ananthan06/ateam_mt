import 'package:flutter/material.dart';
import 'package:flutter_app_mt/screens/demo_ui_screen.dart';
import 'package:flutter_app_mt/screens/products_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  navigateToProducts();
                },
                child: const Text("PRODUCTS")),
            const SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {
              navigateToUIScreen();
            }, child: const Text("UI Demo")),
          ],
        ),
      ),
    );
  }

  navigateToProducts() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return ProductsListScreen();
    }));
  }
  navigateToUIScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return DemoUIScreen();
    }));
  }
}
