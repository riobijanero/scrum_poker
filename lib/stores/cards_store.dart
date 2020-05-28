import 'package:mobx/mobx.dart';
import '../models/estimation_values.dart';
import '../models/estimation_value.dart';

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

  @action
  void setFibonacci() {
    cardDeckTitle = 'Fibonacci';
    estimationValueList = EstimationValues.fibonacciList;
  }

  @action
  void setStandardNumbers() {
    cardDeckTitle = 'Standard';
    estimationValueList = EstimationValues.standardList;
  }

  @action
  void setTshirtSizes() {
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
