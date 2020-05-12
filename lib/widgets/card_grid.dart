import 'package:flutter/material.dart';
import 'package:scrum_poker/models/scrum_complexity.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        childAspectRatio: .8,
        crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
        children: cardsStore.scrumCardsList
            .map(
              (scrumCard) => GestureDetector(
                  key: ValueKey<String>(scrumCard.scrumComplexity.complexityValue),
                  child: Hero(tag: 'heroTag ${scrumCard.scrumComplexity.complexityValue}', child: scrumCard),
                  onTap: () => _onGridCardPressed(context, scrumCard.scrumComplexity)),
            )
            .toList(),
      ),
    );
  }

  void _onGridCardPressed(BuildContext context, ScrumComplexity scrumComplexity) {
    cardsStore.selectComplexity(scrumComplexity);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CardDetailScreen(scrumComplexity);
    }));
  }
}
