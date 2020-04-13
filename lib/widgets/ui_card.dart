import 'package:flutter/material.dart';
import '../models/scrum_card.dart';

class UiCard extends StatelessWidget {
  final ScrumCard scrumCard;
  final bool isSelected;
  void Function() onTab;

  UiCard(this.scrumCard, {this.isSelected = false, this.onTab});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected ? onTab : null,
      child: SizedBox(
        height: 500,
        width: 350,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: isSelected ? 0.3 : 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(10),
          elevation: 8,
          child: Center(
              child: Text(
            scrumCard.cardValue,
            style: isSelected ? Theme.of(context).textTheme.display1 : Theme.of(context).textTheme.display2,
          )),
        ),
      ),
    );
  }
}
