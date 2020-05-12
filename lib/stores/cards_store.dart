import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import '../models/complexity_list.dart';
import '../models/scrum_complexity.dart';
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
  ScrumComplexity selectedCard;

  @observable
  List<ScrumCard> scrumCardsList = fibonacciList;

  static List<ScrumCard> standardList = List.generate(ComplexityList.standardList.length, (int index) {
    return ScrumCard(
        key: ValueKey(
          ComplexityList.standardList[index].complexityValue.toString(),
        ),
        scrumComplexity: ComplexityList.standardList[index]);
  });

  static List<ScrumCard> fibonacciList = List.generate(
      ComplexityList.fibonacciList.length,
      (int index) => ScrumCard(
          key: ValueKey(ComplexityList.fibonacciList[index].complexityValue.toString()),
          scrumComplexity: ComplexityList.fibonacciList[index]));

  static List<ScrumCard> tShirtList = List.generate(
      ComplexityList.tShirtList.length,
      (int index) => ScrumCard(
          key: ValueKey(ComplexityList.tShirtList[index].complexityValue.toString()),
          scrumComplexity: ComplexityList.tShirtList[index]));

  @action
  void setFibonacci() {
    scrumCardsList = fibonacciList;
    cardDeckTitle = 'Fibonacci';
  }

  @action
  void setStandardNumbers() {
    scrumCardsList = standardList;
    cardDeckTitle = 'Standard';
  }

  @action
  void setTshirtSizes() {
    scrumCardsList = tShirtList;
    cardDeckTitle = 'T-Shirt';
  }

  @action
  void resetCard() {
    isMenuCardSelected = false;
    selectedCard = null;
  }

  @action
  void selectCard(ScrumComplexity card) {
    isMenuCardSelected = true;
    selectedCard = card;
    print('selectedCard: $selectedCard');
    print('isMenuCardSelected: $isMenuCardSelected');
  }

  @action
  void toggleMenuStatus() {
    isMenuCollapsed = !isMenuCollapsed;
    print('isMenuCollapsed: $isMenuCollapsed');
  }
}
