import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../models/estimation_value.dart';

class SingleCardRow extends StatelessWidget {
  final EstimationValue estimationValue;

  const SingleCardRow(this.estimationValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400], blurRadius: 3, offset: Offset(1, 1))
        ],
      ),
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: <Widget>[
          RowCard(estimationValue: estimationValue),
          SizedBox(width: 20),
          Expanded(
              child: Text(
            estimationValue.description,
            style: Theme.of(context).textTheme.bodyText1,
          ))
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
    bool isDarkMode = Provider.of<AppState>(context).isDarkMode;
    return Hero(
      tag: 'heroTag ${estimationValue.value}',
      child: Container(
        height: 70,
        width: 65,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Theme.of(context).cardColor, // AppTheme.getRandomColor(),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 1],
              colors: isDarkMode
                  ? [
                      Theme.of(context).accentColor,
                      Theme.of(context).splashColor,
                    ]
                  : [Theme.of(context).cardColor, Theme.of(context).cardColor]),
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 2, offset: Offset(0.5, 0.5))
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
                style: Theme.of(context).textTheme.headline6,
              )),
      ),
    );
  }
}
