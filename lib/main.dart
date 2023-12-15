import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tpop/route_provider.dart';
import 'package:test_tpop/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: routeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/homePage',
        routes: routes,
      ),
    );
  }
}
