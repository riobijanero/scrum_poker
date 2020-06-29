import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/estimation_value.dart';
import './single_card_row.dart';

import '../../stores/cards_store.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> with TickerProviderStateMixin {
  static List<EstimationValue> _initialList = [];
  Duration _duration = Duration(milliseconds: 200);
  bool mounted = true;

  List<EstimationValue> _estimationValueList;
  CardsStore _cardsStore;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  AnimationController _animationController;
  Animation<Offset> _slideAnimation;
  bool isListAlreadyPopulated = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _cardsStore = Provider.of<CardsStore>(context);
    _estimationValueList = _cardsStore.estimationValueList;

    isListAlreadyPopulated = _initialList.length >= _estimationValueList.length;
    // if (isListAlreadyPopulated) {
    //   _slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0))
    //       .animate(_animationController);
    // } else {
    //   populateListWithDelay();
    // }
    populateListWithDelay();
  }

  void populateListWithDelay() async {
    // if (isListAlreadyPopulated) {
    //   return;
    // }
    for (int i = 0; i < _estimationValueList.length; i++) {
      await Future.delayed(_duration, () {
        if (mounted) {
          _animationController.forward();
          _insertSingleItem(_estimationValueList[i], i);
        }
      });
    }
  }

  void _insertSingleItem(EstimationValue item, int index) {
    int insertIndex = _initialList.length;
    _initialList.insert(insertIndex, item);
    _listKey.currentState.insertItem(insertIndex);
  }

  Widget _buildItem(EstimationValue estimationValue, Animation animation) {
    // return FadeTransition(
    //   opacity: animation,
    //   child: SingleCardRow(estimationValue),
    // );
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: animation,
        child: SingleCardRow(estimationValue),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _initialList.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(_initialList[index], animation);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    mounted = false;
    _initialList.clear();
  }
}
