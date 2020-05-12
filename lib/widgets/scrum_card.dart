import 'package:flutter/material.dart';
import '../models/scrum_complexity.dart';

class ScrumCard extends StatelessWidget {
  final ScrumComplexity scrumComplexity;
  final bool isSelected;
  final void Function() onTab;

  ScrumCard({
    Key key,
    this.scrumComplexity,
    this.isSelected = false,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected ? onTab : null,
      child: AspectRatio(
        aspectRatio: 3.5 / 5.5,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: isSelected ? 0.3 : 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(10),
          elevation: 8,
          child: Center(
              child: Text(
            scrumComplexity.complexityValue,
            style: isSelected ? Theme.of(context).textTheme.display1 : Theme.of(context).textTheme.display2,
          )),
        ),
      ),
    );
  }
}
