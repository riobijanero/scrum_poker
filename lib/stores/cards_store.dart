import 'package:flutter/material.dart';
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
  ScrumCard selectedCard;

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
