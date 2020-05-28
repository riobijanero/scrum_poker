import 'dart:math';

import 'package:flutter/material.dart';
import '../models/estimation_value.dart';
import 'package:scrum_poker/widgets/card_detail_screen.dart';
import '../stores/cards_store.dart';

class CardStack extends StatelessWidget {
  CardStack({
    Key key,
    @required this.currentPage,
    @required CardsStore cardsStore,
    @required this.controller,
  })  : _cardsStore = cardsStore,
        super(key: key);

  final double currentPage;
  EstimationValue _currentComplexity;
  final CardsStore _cardsStore;
  final PageController controller;
  List<StackCard> cardStackList;

  @override
  Widget build(BuildContext context) {
    cardStackList = List.generate(
        _cardsStore.estimationValueList.length,
        (int index) => StackCard(
            key: ValueKey(_cardsStore.estimationValueList[index].value.toString()),
            estimationValue: _cardsStore.estimationValueList[index])).reversed.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Stack(
        children: <Widget>[
          CardScrollWidget(currentPage, cardStackList),
          Positioned.fill(
            child: PageView.builder(
              itemCount: cardStackList.length,
              controller: controller,
              reverse: true,
              itemBuilder: (context, index) {
                _currentComplexity = cardStackList[index].estimationValue;
                return GestureDetector(
                  onTap: () => _onStackCardPressed(context, _currentComplexity),
                  child: Hero(
                    tag: 'heroTag ${_currentComplexity.value}',
                    child: Container(color: Colors.transparent),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _onStackCardPressed(BuildContext context, EstimationValue scrumComplexity) {
    _cardsStore.selectComplexity(scrumComplexity);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CardDetailScreen(scrumComplexity);
    }));
  }
}

class CardScrollWidget extends StatelessWidget {
  final double currentPage;
  final List<StackCard> scrumCardList;
  static double padding = 20.0;
  static double verticalInset = 20.0;

  static double cardAspectRatio = 3.5 / 5.5;
  static double widgetAspectRatio = cardAspectRatio * 1.2;

  CardScrollWidget(this.currentPage, this.scrumCardList);

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

        for (int i = 0; i < scrumCardList.length; i++) {
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
                      scrumCardList[i],
                      if (i >= currentPage - 1)
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, bottom: 25),
                            child: Wrap(
                              direction: Axis.vertical,
                              // mainAxisSize: MainAxisSize.min,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    scrumCardList[i].estimationValue.description,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0, bottom: 22.0),
                                  child: GestureDetector(
                                    onTap: () => print('selected'),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent, borderRadius: BorderRadius.circular(20.0)),
                                      child: Text("modify description", style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
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

class StackCard extends StatelessWidget {
  final EstimationValue estimationValue;
  static const num borderRadius = 20.0;

  StackCard({
    Key key,
    this.estimationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.3),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: EdgeInsets.all(10),
      elevation: 8,
      child: estimationValue.isImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: FittedBox(
                child: Image.asset(estimationValue.value),
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Text(estimationValue.value, style: Theme.of(context).textTheme.display1),
            ),
    );
  }
}
