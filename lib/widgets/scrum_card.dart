import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
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
    bool isDarkMode = Provider.of<AppState>(context).isDarkMode;
    return AspectRatio(
      aspectRatio: 3.5 / 5.2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.4, 1],
              colors: isDarkMode
                  ? [
                      Theme.of(context).accentColor,
                      Theme.of(context).splashColor,
                    ]
                  : [Theme.of(context).cardColor, Theme.of(context).cardColor]),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(color: Colors.black54, blurRadius: isDarkMode ? 4 : 8)
          ],
        ),
        margin: EdgeInsets.all(30),
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
                style: isSelected
                    ? Theme.of(context).textTheme.headline4
                    : Theme.of(context).textTheme.headline3,
              )),
      ),
    );
  }
}
