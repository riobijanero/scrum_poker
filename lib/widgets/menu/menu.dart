import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'menu_item_row.dart';
import '../../app_state.dart';

import 'package:scrum_poker/stores/cards_store.dart';
import 'package:provider/provider.dart';

import '../../models/menu_item.dart';

const Duration menuAnimationDuration = const Duration(milliseconds: 350);

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  CardsStore _cardsStore;
  double screenWidth, screenHeight;
  MenuItem menutItemStandard;
  MenuItem menuItemFibonacci;
  MenuItem menutItemTshirt;
  List<MenuItem> menutItemList;
  @override
  void initState() {
    menuItemFibonacci = MenuItem(
        menuItemTitle: 'Fibonacci',
        isSelected: true,
        menuItemicon: Icons.filter_3);
    menutItemStandard = MenuItem(
        menuItemTitle: 'Standard',
        isSelected: false,
        menuItemicon: Icons.timer);
    menutItemTshirt = MenuItem(
        menuItemTitle: 'T-shirt',
        isSelected: false,
        menuItemicon: Icons.landscape);
    menutItemList = [menutItemStandard, menuItemFibonacci, menutItemTshirt];
    super.initState();
  }

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

    return Observer(
      builder: (_) => AnimatedPositioned(
        duration: menuAnimationDuration,
        top: 0,
        bottom: 0,
        left: _cardsStore.isMenuCollapsed ? -0.5 * screenWidth : 0,
        right: 0,
        child: Scaffold(
          backgroundColor:
              Provider.of<AppState>(context).isDarkMode ? Colors.black38 : null,
          body: SafeArea(
            bottom: true,
            child: Padding(
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
                      Text(
                        'Darkmode',
                        style: TextStyle(fontSize: 24),
                      ),
                      Switch(
                          value: Provider.of<AppState>(context, listen: false)
                              .isDarkMode,
                          onChanged: (boolValue) {
                            Provider.of<AppState>(context, listen: false)
                                .toggleThemeMode();
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
