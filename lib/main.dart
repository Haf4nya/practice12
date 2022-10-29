import 'package:flutter/material.dart';
import 'package:practice12/Pages/AuthPage.dart';
import 'package:provider/provider.dart';
import 'package:practice12/theme/modelTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(
            builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
            title: 'MyApp',
            theme: themeNotifier.isDark
                ? ThemeData(
                    brightness: Brightness.dark,
                  )
                : ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.blue[700],
                    primarySwatch: Colors.blue),
            debugShowCheckedModeBanner: false,
            home: const AuthPage(),
          );
        }));
  }
}
