import 'package:flutter/material.dart';
import '../models/estimation_value.dart';

class ScrumCard extends StatelessWidget {
  final EstimationValue estimationValue;
  final bool isSelected;
  static const num borderRadius = 20.0;

  ScrumCard({
    Key key,
    this.estimationValue,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.5 / 5.2,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.2),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        margin: EdgeInsets.all(30),
        elevation: 10,
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
                style: isSelected ? Theme.of(context).textTheme.display1 : Theme.of(context).textTheme.display2,
              )),
      ),
    );
  }
}
