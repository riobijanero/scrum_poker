import 'package:flutter/material.dart';
import '../models/estimation_value.dart';

class ScrumCard extends StatelessWidget {
  final EstimationValue estimationValue;
  final bool isSelected;

  ScrumCard({
    Key key,
    this.estimationValue,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5.5,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: isSelected ? 0.3 : 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(isSelected ? 40 : 10),
        elevation: 8,
        child: Center(
            child: Text(
          estimationValue.value,
          style: isSelected ? Theme.of(context).textTheme.display1 : Theme.of(context).textTheme.display2,
        )),
      ),
    );
  }
}
