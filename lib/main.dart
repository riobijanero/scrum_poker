import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/widgets/menu/menu.dart';

import './app_state.dart';
import './app_theme.dart';
import 'widgets/carddeck.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Scrum Poker',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: MultiProvider(
            providers: [
              Provider<CardsStore>(create: (_) => CardsStore()),
            ],
            child: MenuCardDeckStack(),
          ),
        );
      },
    );
  }
}

class MenuCardDeckStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[Menu(), CardsDeck()],
      ),
    );
  }
}
