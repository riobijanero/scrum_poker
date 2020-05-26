import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import '../models/estimation_values.dart';
import '../models/estimation_value.dart';
import '../widgets/scrum_card.dart';

part 'cards_store.g.dart';

class CardsStore = _CardsStore with _$CardsStore;

abstract class _CardsStore with Store {
  @observable
  bool isMenuCollapsed = true;

  @observable
  bool isMenuCardSelected = false;

  @observable
  String cardDeckTitle = 'Fibnoacci';

  @observable
  EstimationValue selectedEstimationValue;

  @observable
  List<EstimationValue> estimationValueList = EstimationValues.fibonacciList;

  @observable
  List<ScrumCard> scrumCardsList = fibonacciList;

  static List<ScrumCard> standardList = List.generate(EstimationValues.standardList.length, (int index) {
    return ScrumCard(
        key: ValueKey(
          EstimationValues.standardList[index].value.toString(),
        ),
        estimationValue: EstimationValues.standardList[index]);
  });

  static List<ScrumCard> fibonacciList = List.generate(
      EstimationValues.fibonacciList.length,
      (int index) => ScrumCard(
          key: ValueKey(EstimationValues.fibonacciList[index].value.toString()),
          estimationValue: EstimationValues.fibonacciList[index]));

  static List<ScrumCard> tShirtList = List.generate(
      EstimationValues.tShirtList.length,
      (int index) => ScrumCard(
          key: ValueKey(EstimationValues.tShirtList[index].value.toString()),
          estimationValue: EstimationValues.tShirtList[index]));

  @action
  void setFibonacci() {
    scrumCardsList = fibonacciList;
    cardDeckTitle = 'Fibonacci';
    estimationValueList = EstimationValues.fibonacciList;
  }

  @action
  void setStandardNumbers() {
    scrumCardsList = standardList;
    cardDeckTitle = 'Standard';
    estimationValueList = EstimationValues.standardList;
  }

  @action
  void setTshirtSizes() {
    scrumCardsList = tShirtList;
    cardDeckTitle = 'T-Shirt';
    estimationValueList = EstimationValues.tShirtList;
  }

  @action
  void resetCard() {
    isMenuCardSelected = false;
    selectedEstimationValue = null;
  }

  @action
  void selectComplexity(EstimationValue complexity) {
    isMenuCardSelected = true;
    selectedEstimationValue = complexity;
    print('selectedCard: $selectedEstimationValue');
    print('isMenuCardSelected: $isMenuCardSelected');
  }

  @action
  void toggleMenuStatus() {
    isMenuCollapsed = !isMenuCollapsed;
    print('isMenuCollapsed: $isMenuCollapsed');
  }
}
