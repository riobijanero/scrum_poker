import 'package:flutter/material.dart';
import '../../models/estimation_value.dart';

class SliderCardDescription extends StatelessWidget {
  const SliderCardDescription({
    Key key,
    @required this.estimationValue,
    @required this.borderRadius,
    @required this.shadowBlur,
    @required this.shadowOffset,
  }) : super(key: key);

  final EstimationValue estimationValue;
  final num borderRadius;
  final double shadowBlur;
  final double shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        estimationValue.description,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      width: 230,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100], // AppTheme.getRandomColor(),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: shadowBlur,
              offset: Offset(shadowOffset, shadowOffset))
        ],
      ),
    );
  }
}
