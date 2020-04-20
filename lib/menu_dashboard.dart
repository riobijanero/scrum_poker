import 'dart:math';

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
  PageController controller;
  double currentPage;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: dashboardDuration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_animationController);
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
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: _cardsStore.isMenuCardSelected
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: UiCard(
                      _cardsStore.selectedCard,
                      isSelected: true,
                      onTab: _cardsStore.resetCard,
                    ),
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
                                  child: Stack(
                                    children: <Widget>[
                                      CardScrollWidget(currentPage, _cardsStore),
                                      Positioned.fill(
                                        child: PageView.builder(
                                          itemCount: _cardsStore.scrumCardsList.length,
                                          controller: controller,
                                          reverse: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                _cardsStore.selectCard(_cardsStore.scrumCardsList[index].scrumCard);
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  // GridViewCards(cardsStore: _cardsStore, orientation: orientation),

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

class GridViewCards extends StatelessWidget {
  const GridViewCards({
    Key key,
    @required this.cardsStore,
    @required this.orientation,
  }) : super(key: key);

  final CardsStore cardsStore;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        childAspectRatio: .8,
        crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
        children: cardsStore.scrumCardsList
            .map(
              (uiCard) => GestureDetector(
                key: ValueKey<String>(uiCard.scrumCard.cardValue),
                child: uiCard,
                onTap: () {
                  cardsStore.selectCard(uiCard.scrumCard);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  double currentPage;
  final CardsStore cardsStore;
  static double padding = 20.0;
  static double verticalInset = 20.0;

  static double cardAspectRatio = 12.0 / 16.0;
  double widgetAspectRatio = cardAspectRatio * 1.2;

  CardScrollWidget(
    this.currentPage,
    this.cardsStore,
  );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        double width = contraints.maxWidth;
        double height = contraints.maxHeight;

        double safeWidth = width - 2 * padding;
        double safeHeight = height - 2 * padding;

        double heightOfPrimaryCard = safeHeight;
        double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        double primaryCardLeft = safeWidth - widthOfPrimaryCard;
        double horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = List();

        for (int i = 0; i < cardsStore.scrumCardsList.length; i++) {
          num delta = i - currentPage;
          bool isOnRight = delta > 0;

          double start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

          Positioned cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                // decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryVariant, // Colors.white,
                //     boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0)]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      cardsStore.scrumCardsList[i],
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: <Widget>[
                      //       Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      //         child: Text(cardsStore.scrumCardsList[i].scrumCard.description,
                      //             style: TextStyle(fontSize: 25.0)),
                      //       ),
                      //       SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                      //         child: Container(
                      //           padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                      //           decoration:
                      //               BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20.0)),
                      //           child: Text("Read Later", style: TextStyle(color: Colors.white)),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
