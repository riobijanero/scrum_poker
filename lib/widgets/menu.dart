import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../app_state.dart';

import 'package:scrum_poker/stores/cards_store.dart';
import 'package:provider/provider.dart';

const Duration menuAnimationDuration = const Duration(milliseconds: 350);

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  // AnimationController _animationController;
  // Animation<Offset> _menuSlideAnimation;
  // Animation<double> _menuScaleAnimation;
  CardsStore _cardsStore;
  double screenWidth, screenHeight;
  static const double menuItemdistance = 20.0;

  // @override
  // void initState() {
  //   _animationController = AnimationController(vsync: this, duration: menuAnimationDuration);
  //   _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_animationController);

  //   _menuSlideAnimation = Tween<Offset>(begin: Offset(-0.5, 0), end: Offset(0, 0)).animate(_animationController);
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  // @override
  // void dispose() {
  //   // _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    _cardsStore = Provider.of<CardsStore>(context);

    // if (_cardsStore.isMenuCollapsed) {
    //   _animationController.forward();
    // } else {
    //   _animationController.reverse();
    // }
    return Observer(
      builder: (_) => AnimatedPositioned(
        duration: menuAnimationDuration,
        top: 0,
        bottom: 0,
        left: _cardsStore.isMenuCollapsed ? -0.5 * screenWidth : 0,
        right: 0,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: _cardsStore.setFibonacci,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.filter_3),
                      ),
                      Text('Fibonacci'),
                    ],
                  ),
                ),
                SizedBox(height: menuItemdistance),
                InkWell(
                  onTap: _cardsStore.setStandardNumbers,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.timer),
                      ),
                      Text('Standard'),
                    ],
                  ),
                ),
                SizedBox(height: menuItemdistance),
                InkWell(
                  onTap: _cardsStore.setTshirtSizes,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.landscape),
                      ),
                      Text('T-Shirt'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.brightness_3),
                    ),
                    Text('Darkmode'),
                    Switch(
                        value: Provider.of<AppState>(context, listen: false).isDarkMode,
                        onChanged: (boolValue) {
                          Provider.of<AppState>(context, listen: false).toggleThemeMode();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
