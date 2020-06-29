import 'package:flutter/material.dart';

import '../../models/estimation_value.dart';

class SingleCardRow extends StatelessWidget {
  final EstimationValue estimationValue;

  const SingleCardRow(this.estimationValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: <Widget>[
          RowCard(estimationValue: estimationValue),
          SizedBox(width: 20),
          Expanded(child: Text(estimationValue.description))
        ],
      ),
    );
  }
}

class RowCard extends StatelessWidget {
  final EstimationValue estimationValue;
  static const num _borderRadius = 10.0;

  RowCard({
    Key key,
    this.estimationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 60,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // AppTheme.getRandomColor(),
        borderRadius: BorderRadius.circular(_borderRadius),
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 6, offset: Offset(2, 2))
        ],
      ),
      child: estimationValue.isImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(_borderRadius),
              child: FittedBox(
                child: Image.asset(estimationValue.value),
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Text(
              estimationValue.value,
              style: TextStyle(fontSize: 20),
              // style: Theme.of(context).textTheme.display2,
            )),
    );
  }
}
