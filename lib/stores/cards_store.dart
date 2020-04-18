import 'package:mobx/mobx.dart';
import '../models/scrum_card.dart';
import '../widgets/ui_card.dart';

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
  ScrumCard selectedCard;

  @observable
  List<UiCard> scrumCardsList = fibonacciList;

  static List<UiCard> standardList = [
    UiCard(ScrumCard(cardValue: 1.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 2.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 3.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 5.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 8.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 13.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 20.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 40.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 100.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: '∞', description: 'test description')),
    UiCard(ScrumCard(cardValue: '?', description: 'test description')),
  ];

  static List<UiCard> fibonacciList = [
    UiCard(ScrumCard(cardValue: 1.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 2.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 3.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 5.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 8.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 13.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 21.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 34.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: 55.toString(), description: 'test description')),
    UiCard(ScrumCard(cardValue: '∞', description: 'test description')),
    UiCard(ScrumCard(cardValue: '?', description: 'test description')),
  ];

  static List<UiCard> tShirtList = [
    UiCard(ScrumCard(cardValue: 'XS', description: 'test description')),
    UiCard(ScrumCard(cardValue: 'S', description: 'test description')),
    UiCard(ScrumCard(cardValue: 'M', description: 'test description')),
    UiCard(ScrumCard(cardValue: 'L', description: 'test description')),
    UiCard(ScrumCard(cardValue: 'XL', description: 'test description')),
    UiCard(ScrumCard(cardValue: 'XXL', description: 'test description')),
    UiCard(ScrumCard(cardValue: '∞', description: 'test description')),
    UiCard(ScrumCard(cardValue: '?', description: 'test description')),
  ];

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
  void selectCard(ScrumCard card) {
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
