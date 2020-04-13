import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scrum_poker/stores/cards_store.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/widgets/menu.dart';
import 'package:scrum_poker/widgets/ui_card.dart';

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
                          child: Observer(
                            builder: (_) => Scaffold(
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
                                  _cardsStore.cardDeckTitle,
                                ),
                              ),
                              body: SafeArea(
                                child: AbsorbPointer(
                                  absorbing: _cardsStore.isMenuCollapsed ? false : true,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GridView.count(
                                      childAspectRatio: .8,
                                      crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
                                      children: _cardsStore.scrumCardsList
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

                                  // Column(
                                  //   children: <Widget>[
                                  //     Container(
                                  //       height: 200,
                                  //       child: PageView(
                                  //         controller: PageController(viewportFraction: 0.8),
                                  //         scrollDirection: Axis.horizontal,
                                  //         pageSnapping: true,
                                  //         children: <Widget>[
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.redAccent, borderRadius: borderRadiusCards),
                                  //             margin: const EdgeInsets.symmetric(horizontal: 8),
                                  //             width: 100,
                                  //           ),
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.blueAccent, borderRadius: borderRadiusCards),
                                  //             margin: const EdgeInsets.symmetric(horizontal: 8),
                                  //             width: 100,
                                  //           ),
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.greenAccent, borderRadius: borderRadiusCards),
                                  //             margin: const EdgeInsets.symmetric(horizontal: 8),
                                  //             width: 100,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
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
