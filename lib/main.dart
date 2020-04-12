import 'package:flutter/material.dart';
// import 'package:scrum_poker/app_theme.dart';
import 'package:scrum_poker/menu_dashboard.dart';
import 'package:provider/provider.dart';
import './stores/cards_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: MultiProvider(
        providers: [Provider<CardsStore>(create: (_) => CardsStore())],
        child: MenuDashboard(),
      ),
    );
  }
}
