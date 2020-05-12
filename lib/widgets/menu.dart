import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/menu_item_row.dart';
import '../app_state.dart';

import 'package:scrum_poker/stores/cards_store.dart';
import 'package:provider/provider.dart';

import '../models/menu_item.dart';

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
  MenuItem menutItemStandard;
  MenuItem menuItemFibonacci;
  MenuItem menutItemTshirt;
  List<MenuItem> menutItemList;
  @override
  void initState() {
    menuItemFibonacci = MenuItem(menuItemTitle: 'Fibonacci', isSelected: true, menuItemicon: Icons.filter_3);
    menutItemStandard = MenuItem(menuItemTitle: 'Standard', isSelected: false, menuItemicon: Icons.timer);
    menutItemTshirt = MenuItem(menuItemTitle: 'T-shirt', isSelected: false, menuItemicon: Icons.landscape);
    menutItemList = [menutItemStandard, menuItemFibonacci, menutItemTshirt];
    super.initState();
  }

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
  void onMenutItemRowPressed(MenuItem chosenMenuItem) {
    for (MenuItem menuItem in menutItemList) {
      setState(() {
        menuItem.isSelected = false;
      });
    }
    setState(() {
      chosenMenuItem.isSelected = true;
    });
  }

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
        child: SafeArea(
          bottom: true,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MenutItemRow(
                    menuItem: menuItemFibonacci,
                    onPressed: () {
                      onMenutItemRowPressed(menuItemFibonacci);
                      _cardsStore.setFibonacci();
                    },
                  ),
                  MenutItemRow(
                    menuItem: menutItemStandard,
                    onPressed: () {
                      onMenutItemRowPressed(menutItemStandard);
                      _cardsStore.setStandardNumbers();
                    },
                  ),
                  MenutItemRow(
                    menuItem: menutItemTshirt,
                    onPressed: () {
                      onMenutItemRowPressed(menutItemTshirt);
                      _cardsStore.setTshirtSizes();
                    },
                  ),
                  SizedBox(height: 0),
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
      ),
    );
  }
}
