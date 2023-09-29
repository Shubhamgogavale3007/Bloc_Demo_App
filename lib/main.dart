import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_bloc/cart_screen/cart_screen_bloc.dart';
import 'package:trial_bloc/cart_screen/cart_screen_ui.dart';
import 'package:trial_bloc/dashboard/dashboard_bloc.dart';

import 'dashboard/dashboard_ui_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: CartScreen(),
      ),
    );
  }
}
