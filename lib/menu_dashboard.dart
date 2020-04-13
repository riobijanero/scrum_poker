import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scrum_poker/app_state.dart';
import 'package:scrum_poker/models/scrum_card.dart';
import 'package:scrum_poker/stores/cards_store.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/widgets/ui_card.dart';

final Color backgroundColor = Color(0xFF4A4A58);
const double menuFontSize = 22.0;
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
        children: <Widget>[Menu(), Dashboard()],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _menuSlideAnimation;
  Animation<double> _menuScaleAnimation;
  CardsStore _cardsStore;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: dashboardDuration);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_animationController);

    _menuSlideAnimation = Tween<Offset>(begin: Offset(-0.5, 0), end: Offset(0, 0)).animate(_animationController);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    _cardsStore = Provider.of<CardsStore>(context);

    if (_cardsStore.isMenuCollapsed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    return Observer(
      builder: (_) => AnimatedPositioned(
        duration: dashboardDuration,
        top: 0,
        bottom: 0,
        left: _cardsStore.isMenuCollapsed ? -0.5 * screenWidth : 0,
        right: 0,
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Dashboard ', style: TextStyle(fontSize: menuFontSize)),
                  SizedBox(height: 10),
                  Text('Fibonacci', style: TextStyle(fontSize: menuFontSize)),
                  SizedBox(height: 10),
                  Text('T-Shirt Size', style: TextStyle(fontSize: menuFontSize)),
                  SizedBox(height: 10),
                  Text('Other', style: TextStyle(fontSize: menuFontSize)),
                  SizedBox(height: 10),
                  Text('Fibonacci', style: TextStyle(fontSize: menuFontSize)),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Switch(
                          value: Provider.of<AppState>(context, listen: false).isDarkMode,
                          onChanged: (boolValue) {
                            Provider.of<AppState>(context, listen: false).toggleThemeMode();
                          }),
                      Text('Darkmode', style: TextStyle(fontSize: menuFontSize)),
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

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  CardsStore _cardsStore;
  AnimationController _animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: dashboardDuration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cardsStore = Provider.of<CardsStore>(context);
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    List<UiCard> scrumCardList = [
      UiCard(ScrumCard(cardValue: 1.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 2.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 3.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 5.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 8.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 13.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 20.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 40.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: 100.toString(), description: 'test description')),
      UiCard(ScrumCard(cardValue: '?', description: 'test description')),
    ];

    return Observer(
      builder: (_) => AnimatedPositioned(
        duration: dashboardDuration,
        top: 0,
        bottom: 0,
        left: _cardsStore.isMenuCollapsed ? 0 : 0.5 * screenWidth,
        right: _cardsStore.isMenuCollapsed ? 0 : -0.5 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: _cardsStore.isMenuCardSelected
                ? UiCard(
                    _cardsStore.selectedCard,
                    isSelected: true,
                    onTab: _cardsStore.resetCard,
                  )
                : Material(
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
                          onTap: () {
                            _cardsStore.isMenuCollapsed ? null : _cardsStore.toggleMenuStatus();
                            _animationController.reverse();
                          },
                          child: Scaffold(
                            resizeToAvoidBottomInset: true,
                            appBar: AppBar(
                              elevation: 0.0,
                              leading: IconButton(
                                icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: _animationController),
                                onPressed: () {
                                  if (_cardsStore.isMenuCollapsed) {
                                    _animationController.forward();
                                  } else {
                                    _animationController.reverse();
                                  }
                                  _cardsStore.toggleMenuStatus();
                                },
                              ),
                              title: Text(
                                'Cards',
                              ),
                            ),
                            body: SafeArea(
                              child: AbsorbPointer(
                                absorbing: _cardsStore.isMenuCollapsed ? false : true,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: GridView.count(
                                        childAspectRatio: .8,
                                        crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
                                        children: scrumCardList
                                            .map(
                                              (uiCard) => GestureDetector(
                                                key: ValueKey<String>(uiCard.scrumCard.cardValue),
                                                child: uiCard,
                                                onTap: () {
                                                  print('value: ${uiCard.scrumCard.cardValue}');
                                                  _cardsStore.selectCard(uiCard.scrumCard);
                                                },
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    // Container(
                                    //   height: 200,
                                    //   child: PageView(
                                    //     controller: PageController(viewportFraction: 0.8),
                                    //     scrollDirection: Axis.horizontal,
                                    //     pageSnapping: true,
                                    //     children: <Widget>[
                                    //       Container(
                                    //         decoration: BoxDecoration(color: Colors.redAccent, borderRadius: borderRadiusCards),
                                    //         margin: const EdgeInsets.symmetric(horizontal: 8),
                                    //         width: 100,
                                    //       ),
                                    //       Container(
                                    //         decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: borderRadiusCards),
                                    //         margin: const EdgeInsets.symmetric(horizontal: 8),
                                    //         width: 100,
                                    //       ),
                                    //       Container(
                                    //         decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: borderRadiusCards),
                                    //         margin: const EdgeInsets.symmetric(horizontal: 8),
                                    //         width: 100,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
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
      ),
    );
  }
}
