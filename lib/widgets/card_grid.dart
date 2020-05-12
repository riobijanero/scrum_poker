import 'package:flutter/material.dart';
import '../stores/cards_store.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({
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
                key: ValueKey<String>(uiCard.scrumComplexity.complexityValue),
                child: uiCard,
                onTap: () {
                  cardsStore.selectCard(uiCard.scrumComplexity);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
