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
              (gridCard) => GestureDetector(
                  key: ValueKey<String>(gridCard.estimationValue.value),
                  child: Hero(tag: 'heroTag ${gridCard.estimationValue.value}', child: gridCard),
                  onTap: () => _onGridCardPressed(context, gridCard.estimationValue)),
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
  static const num borderRadius = 20.0;

  GridCard({
    Key key,
    this.estimationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // AppTheme.getRandomColor(),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 6, offset: Offset(2, 2))],
      ),
      margin: EdgeInsets.all(10),
      child: estimationValue.isImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: FittedBox(
                child: Image.asset(estimationValue.value),
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Text(
              estimationValue.value,
              style: Theme.of(context).textTheme.display2,
            )),
    );

    // return Card(
    //   shape: RoundedRectangleBorder(
    //     side: BorderSide(width: 0.1),
    //     borderRadius: BorderRadius.circular(borderRadius),
    //   ),
    //   margin: EdgeInsets.all(10),
    //   elevation: 8,
    //   child: estimationValue.isImage
    //       ? ClipRRect(
    //           borderRadius: BorderRadius.circular(borderRadius),
    //           child: FittedBox(
    //             child: Image.asset(estimationValue.value),
    //             fit: BoxFit.cover,
    //           ),
    //         )
    //       : Center(
    //           child: Text(
    //           estimationValue.value,
    //           style: Theme.of(context).textTheme.display2,
    //         )),
    // );
  }
}
