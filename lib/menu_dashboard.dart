import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/widgets/card_slider.dart';
import './stores/cards_store.dart';
import './widgets/card_stack.dart';
import './widgets/card_grid.dart';
import './widgets/menu.dart';
import './models/menu_item.dart';
import './widgets/selection_button.dart';

final Color backgroundColor = Color(0xFF4A4A58);

double screenWidth, screenHeight;
const Duration dashboardDuration = const Duration(milliseconds: 350);
const BorderRadius borderRadius = const BorderRadius.all(Radius.circular(40));
const BorderRadius borderRadiusCards = const BorderRadius.all(Radius.circular(20));

class MenuDashboard extends StatelessWidget {
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

class CardsDeck extends StatefulWidget {
  @override
  _CardsDeckState createState() => _CardsDeckState();
}

class _CardsDeckState extends State<CardsDeck> with SingleTickerProviderStateMixin {
  CardsStore _cardsStore;
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  PageController controller;
  double currentPage;
  MenuItem gridViewStyle;
  MenuItem stackViewStyle;
  MenuItem slideViewStyle;
  List<MenuItem> viewStyleList;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: dashboardDuration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_animationController);
    gridViewStyle = MenuItem(menuItemTitle: 'Grid', isSelected: false);
    stackViewStyle = MenuItem(menuItemTitle: 'Stack', isSelected: true);
    slideViewStyle = MenuItem(menuItemTitle: 'Slides', isSelected: false);
    viewStyleList = [gridViewStyle, stackViewStyle, slideViewStyle];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _cardsStore = Provider.of<CardsStore>(context);
    currentPage = _cardsStore.scrumCardsList.length - 1.0;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void collapsMenu() {
    if (!_cardsStore.isMenuCollapsed) _cardsStore.toggleMenuStatus();
    _animationController.reverse();
  }

  void _onMenuIconPressed() {
    {
      if (_cardsStore.isMenuCollapsed) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      _cardsStore.toggleMenuStatus();
    }
  }

  void onCardViewStyleChosen(MenuItem viewStyleIsChosen) {
    for (MenuItem viewStyle in viewStyleList) {
      setState(() {
        viewStyle.isSelected = false;
      });
    }
    setState(() {
      viewStyleIsChosen.isSelected = true;
    });

    print(viewStyleList);
  }

  @override
  Widget build(BuildContext context) {
    controller = PageController(initialPage: _cardsStore.scrumCardsList.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Observer(
      builder: (_) => AnimatedPositioned(
        duration: dashboardDuration,
        top: 0,
        bottom: 0,
        left: _cardsStore.isMenuCollapsed ? 0 : 0.5 * screenWidth,
        right: _cardsStore.isMenuCollapsed ? 0 : -0.5 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            key: ValueKey<String>('mainpage'),
            // animationDuration: dashboardDuration,
            // borderRadius: borderRadius,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(width: 0.3),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            child: OrientationBuilder(
              builder: (context, orientation) {
                return GestureDetector(
                  onHorizontalDragStart: (value) => collapsMenu(),
                  onTap: collapsMenu,
                  child: Observer(
                    builder: (_) => Scaffold(
                      resizeToAvoidBottomInset: true,
                      appBar: AppBar(
                        elevation: 0.0,
                        leading: IconButton(
                          icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: _animationController),
                          onPressed: _onMenuIconPressed,
                        ),
                        title: Text(
                          _cardsStore.cardDeckTitle,
                        ),
                      ),
                      body: SafeArea(
                        child: AbsorbPointer(
                          absorbing: _cardsStore.isMenuCollapsed ? false : true,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SelectionButton(
                                      menuItem: gridViewStyle,
                                      onPress: () => onCardViewStyleChosen(gridViewStyle),
                                    ),
                                    SelectionButton(
                                      menuItem: stackViewStyle,
                                      onPress: () => onCardViewStyleChosen(stackViewStyle),
                                    ),
                                    SelectionButton(
                                      menuItem: slideViewStyle,
                                      onPress: () => onCardViewStyleChosen(slideViewStyle),
                                    ),
                                  ],
                                ),
                              ),
                              gridViewStyle.isSelected
                                  ? Expanded(child: CardGrid(cardsStore: _cardsStore, orientation: orientation))
                                  : stackViewStyle.isSelected
                                      ? CardStack(
                                          currentPage: currentPage, cardsStore: _cardsStore, controller: controller)
                                      : CardSlider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
