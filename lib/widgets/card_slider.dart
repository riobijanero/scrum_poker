import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/stores/cards_store.dart';
import 'package:scrum_poker/widgets/scrum_card.dart';

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  CardsStore _cardsStore;
  final PageController _pageController = PageController(viewportFraction: 0.8);
  // List<ScrumCard> _slideList;
  int currentPage = 0;

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
    // _slideList = _cardsStore.scrumCardsList;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List _slideList = _cardsStore.scrumCardsList.toList();

    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: _slideList.length,
        itemBuilder: (context, int currentIdx) {
          if (currentIdx == 0) {
            return Text('index == 0');
          } else if (_slideList.length >= currentIdx) {
            bool _cardIsActive = currentIdx == currentPage;
            return _buildCard(_slideList[currentIdx - 1], _cardIsActive);
          }
        },
      ),
    );
  }

  _buildCard(Widget card, bool cardIsActive) {
    final double blur = cardIsActive ? 30 : 0;
    final double offset = cardIsActive ? 20 : 0;
    final double topMargin = cardIsActive ? 100 : 200;
    final double bottomMargin = 50;
    final double rightMargin = 30;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin, right: rightMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset))],
      ),
      child: card,
    );
  }
}
