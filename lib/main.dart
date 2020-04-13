import 'package:flutter/material.dart';
import 'package:scrum_poker/app_state.dart';
import 'package:scrum_poker/app_theme.dart';

import 'package:scrum_poker/menu_dashboard.dart';
import 'package:provider/provider.dart';
import './stores/cards_store.dart';

void main() => runApp(
      ChangeNotifierProvider<AppState>(
        create: (context) => AppState(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: MultiProvider(
            providers: [Provider<CardsStore>(create: (_) => CardsStore())],
            child: MenuDashboard(),
          ),
        );
      },
    );
  }
}
