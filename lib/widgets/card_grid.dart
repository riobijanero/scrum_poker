import 'package:flutter/material.dart';
import 'package:scrum_poker/models/estimation_value.dart';
import 'package:scrum_poker/widgets/card_detail_screen.dart';
import '../stores/cards_store.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({
    Key key,
    @required this.cardsStore,
    @required this.orientation,
  }) : super(key: key);

  final CardsStore cardsStore;
  final Orientation orientation;

  static List<GridCard> gridCardList;

  @override
  Widget build(BuildContext context) {
    gridCardList = List.generate(
        cardsStore.estimationValueList.length,
        (int index) => GridCard(
            key: ValueKey(cardsStore.estimationValueList[index].value.toString()),
            estimationValue: cardsStore.estimationValueList[index]));

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        childAspectRatio: .8,
        crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
        children: gridCardList
            .map(
              (scrumCard) => GestureDetector(
                  key: ValueKey<String>(scrumCard.estimationValue.value),
                  child: Hero(tag: 'heroTag ${scrumCard.estimationValue.value}', child: scrumCard),
                  onTap: () => _onGridCardPressed(context, scrumCard.estimationValue)),
            )
            .toList(),
      ),
    );
  }

  void _onGridCardPressed(BuildContext context, EstimationValue scrumComplexity) {
    cardsStore.selectComplexity(scrumComplexity);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CardDetailScreen(scrumComplexity);
    }));
  }
}

class GridCard extends StatelessWidget {
  final EstimationValue estimationValue;

  GridCard({
    Key key,
    this.estimationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      elevation: 8,
      child: Center(
          child: Text(
        estimationValue.value,
        style: Theme.of(context).textTheme.display2,
      )),
    );
  }
}
