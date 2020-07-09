import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/app_state.dart';

import '../../models/estimation_value.dart';
import '../../stores/cards_store.dart';
import '../card_detail_screen.dart';

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  CardsStore _cardsStore;
  final PageController _pageController = PageController(viewportFraction: 0.8);
  List<EstimationValue> _sliderList;
  int currentPage = 0;
  bool _cardIsActive = false;

  @override
  void initState() {
    // set state when the page changes
    _pageController.addListener(() {
      //it gives the exact fractoin of the page that's available in the view, but here rounding it
      int nextPage = _pageController.page.round();
      if (currentPage != nextPage) {
        setState(() {
          currentPage = nextPage;
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _cardsStore = Provider.of<CardsStore>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _sliderList = _cardsStore.estimationValueList;

    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: _sliderList.length,
        itemBuilder: (context, int currentIdx) {
          if (_sliderList.length >= currentIdx) {
            _cardIsActive = currentIdx == currentPage;
            return SliderCard(
                _sliderList[currentIdx], _cardIsActive, _cardsStore);

            // return Column(
            //   children: <Widget>[
            //     Flexible(
            //         flex: 1,
            //         child: AnimatedSwitcher(
            //           duration: Duration(milliseconds: 300),
            //           child: _cardIsActive
            //               ? Center(
            //                   child: Container(
            //                       margin: const EdgeInsets.only(
            //                           left: 25, right: 55),
            //                       child: Text(
            //                         _sliderList[currentIdx].description,
            //                         style:
            //                             Theme.of(context).textTheme.bodyText1,
            //                       )))
            //               : Container(),
            //         )),
            //     Flexible(
            //         flex: 3,
            //         child: SliderCard(
            //             _sliderList[currentIdx], _cardIsActive, _cardsStore)),
            //   ],
            // );
          }
        },
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  final EstimationValue estimationValue;
  final bool cardIsActive;
  final CardsStore cardsStore;
  static const num borderRadius = 20.0;

  SliderCard(this.estimationValue, this.cardIsActive, this.cardsStore);

  @override
  Widget build(BuildContext context) {
    final double shadowBlur = cardIsActive ? 30 : 0;
    final double shadowOffset = cardIsActive ? 20 : 0;
    final double topMargin = cardIsActive ? 100 : 160;
    final double bottomMargin = 50;
    final double rightMargin = 30;

    return GestureDetector(
        onTap: () => _onSliderCardPressed(context, estimationValue),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutQuint,
          margin: EdgeInsets.only(
              top: topMargin, bottom: bottomMargin, right: rightMargin),
          decoration: BoxDecoration(
            // color: Theme.of(context).cardColor, // AppTheme.getRandomColor(),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: Provider.of<AppState>(context).isDarkMode
                    ? [
                        Theme.of(context).accentColor,
                        Theme.of(context).splashColor,
                      ]
                    : [
                        Theme.of(context).cardColor,
                        Theme.of(context).cardColor,
                      ]),
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: shadowBlur,
                  offset: Offset(shadowOffset, shadowOffset))
            ],
          ),
          child: Hero(
            tag: 'heroTag ${estimationValue.value}',
            child: Stack(
              children: <Widget>[
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: SliderCardDescription(
                //       estimationValue: estimationValue,
                //       borderRadius: borderRadius,
                //       shadowBlur: shadowBlur,
                //       shadowOffset: shadowOffset),
                // ),
                Center(
                  child: estimationValue.isImage
                      ? FittedBox(
                          child: Image.asset(estimationValue.value),
                          // fit: BoxFit.cover,
                        )
                      : Text(
                          estimationValue.value,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                ),
              ],
            ),
          ),
        ));
  }

  void _onSliderCardPressed(
      BuildContext context, EstimationValue scrumComplexity) {
    cardsStore.selectComplexity(scrumComplexity);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CardDetailScreen(scrumComplexity);
    }));
  }
}
