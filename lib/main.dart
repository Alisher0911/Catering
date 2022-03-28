import 'package:catering/config/app_router.dart';
import 'package:catering/config/theme.dart';
import 'package:catering/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Food',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGeneratedRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}