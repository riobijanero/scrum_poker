import 'package:flutter/material.dart';
import '../models/scrum_complexity.dart';
import './scrum_card.dart';

class CardDetailScreen extends StatelessWidget {
  final EstimationValue scrumComplexity;

  CardDetailScreen(this.scrumComplexity);

  @override
  Widget build(BuildContext context) {
    String dynamicTag = 'heroTag ${scrumComplexity.value.toString()}';
    print(dynamicTag);
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: dynamicTag,
            child: ScrumCard(
              key: ValueKey('.selectedCard.complexityValue.toString()'),
              scrumComplexity: scrumComplexity,
              isSelected: true,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
