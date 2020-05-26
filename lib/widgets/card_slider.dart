import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/models/estimation_value.dart';
import 'package:scrum_poker/stores/cards_store.dart';
import 'package:scrum_poker/widgets/scrum_card.dart';

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  CardsStore _cardsStore;
  final PageController _pageController = PageController(viewportFraction: 0.8);
  List<SliderCard> _sliderList;
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

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _sliderList = List.generate(
        _cardsStore.estimationValueList.length,
        (int index) => SliderCard(
            key: ValueKey(_cardsStore.estimationValueList[index].value.toString()),
            estimationValue: _cardsStore.estimationValueList[index]));

    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: _sliderList.length,
        itemBuilder: (context, int currentIdx) {
          if (currentIdx == 0) {
            return Text('index == 0');
          } else if (_sliderList.length >= currentIdx) {
            bool _cardIsActive = currentIdx == currentPage;
            return _buildCard(_sliderList[currentIdx - 1], _cardIsActive);
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

class SliderCard extends StatelessWidget {
  final EstimationValue estimationValue;

  SliderCard({
    Key key,
    this.estimationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5.5,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(0),
        elevation: 8,
        child: Center(
            child: Text(
          estimationValue.value,
          style: Theme.of(context).textTheme.display1,
        )),
      ),
    );
  }
}
