import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/widgets/card_detail_screen.dart';
import '../../models/estimation_value.dart';
import './single_card_row.dart';

import '../../stores/cards_store.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> with TickerProviderStateMixin {
  static List<EstimationValue> _initialList = [];
  Duration _listRenderDelayDuration = Duration(milliseconds: 200);
  Duration _slideUpDuration = Duration(milliseconds: 400);
  bool mounted = true;

  List<EstimationValue> _estimationValueList;
  CardsStore _cardsStore;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  AnimationController _slideUpAnimationController;
  Animation<Offset> _slideAnimation;
  CurvedAnimation _curvedAnimation;
  bool isListAlreadyPopulated = false;

  @override
  void initState() {
    super.initState();
    _slideUpAnimationController =
        AnimationController(vsync: this, duration: _slideUpDuration);
    _curvedAnimation = CurvedAnimation(
        parent: _slideUpAnimationController, curve: Curves.linear);

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(_curvedAnimation);
  }

  @override
  void didChangeDependencies() {
    _cardsStore = Provider.of<CardsStore>(context);
    _estimationValueList = _cardsStore.estimationValueList;
    super.didChangeDependencies();
  }

  void populateListWithDelay() async {
    _removeAllItems();
    _initialList.clear();
    for (EstimationValue estimationValue in _cardsStore.estimationValueList) {
      int indexOfItem =
          _cardsStore.estimationValueList.indexOf(estimationValue);
      try {
        await Future.delayed(_listRenderDelayDuration, () {
          if (mounted) {
            _slideUpAnimationController.forward();
            if (!_initialList.contains(estimationValue)) {
              _insertSingleItem(estimationValue, indexOfItem);
            }
          }
        });
      } catch (e) {
        print(e);
      }
    }
    _cardsStore.hasListViewAnimatedAlready = true;
  }

  void _removeAllItems() {
    final length = _initialList.length;
    for (int i = length - 1; i >= 0; i--) {
      EstimationValue removedItem = _initialList.removeAt(i);
      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildAnimatedItem(removedItem, animation);
      };
      _listKey.currentState.removeItem(i, builder);
    }
  }

  void _insertSingleItem(EstimationValue item, int index) {
    int insertIndex = _initialList.length;
    _initialList.insert(insertIndex, item);
    _listKey.currentState.insertItem(insertIndex);
  }

  Widget _buildAnimatedItem(
      EstimationValue estimationValue, Animation animation) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: animation,
        child: _buildTouchableRow(estimationValue),
      ),
    );
  }

  Widget _buildTouchableRow(EstimationValue estimationValue) {
    return GestureDetector(
        child: SingleCardRow(estimationValue),
        onTap: () => _onCardRowPressed(context, estimationValue));
  }

  Widget build(BuildContext context) {
    if (!_cardsStore.hasListViewAnimatedAlready) {
      populateListWithDelay();
    }
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: _cardsStore.hasListViewAnimatedAlready
            ? ListView(
                children: _cardsStore.estimationValueList
                    .map((e) => _buildTouchableRow(e))
                    .toList(),
              )
            : AnimatedList(
                key: _listKey,
                initialItemCount: _initialList.length,
                itemBuilder: (context, index, animation) {
                  return _buildAnimatedItem(_initialList[index], animation);
                },
              ),
      ),
    );

    //    populateListWithDelay();

    // return Expanded(
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     child: AnimatedList(
    //       key: _listKey,
    //       initialItemCount: _initialList.length,
    //       itemBuilder: (context, index, animation) {
    //         return _buildItem(_initialList[index], animation);
    //       },
    //     ),
    //   ),
    // );
  }

  void _onCardRowPressed(
      BuildContext context, EstimationValue scrumComplexity) {
    _cardsStore.selectComplexity(scrumComplexity);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CardDetailScreen(scrumComplexity);
    }));
  }

  @override
  void dispose() {
    super.dispose();
    _slideUpAnimationController.dispose();
    mounted = false;
    _removeAllItems();
    _initialList.clear();
  }
}
