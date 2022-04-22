import 'package:catering/bloc/basket/basket_bloc.dart';
import 'package:catering/bloc/filter/filter_bloc.dart';
import 'package:catering/config/app_router.dart';
import 'package:catering/config/theme.dart';
import 'package:catering/screens/home/home_screen.dart';
import 'package:catering/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterBloc()..add(FilterLoad())),
        BlocProvider(create: (context) => BasketBloc()..add(StartBasket()))
      ],
      child: MaterialApp(
        title: 'Happy Food',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGeneratedRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}