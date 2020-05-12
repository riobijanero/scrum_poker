// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardsStore on _CardsStore, Store {
  final _$isMenuCollapsedAtom = Atom(name: '_CardsStore.isMenuCollapsed');

  @override
  bool get isMenuCollapsed {
    _$isMenuCollapsedAtom.context.enforceReadPolicy(_$isMenuCollapsedAtom);
    _$isMenuCollapsedAtom.reportObserved();
    return super.isMenuCollapsed;
  }

  @override
  set isMenuCollapsed(bool value) {
    _$isMenuCollapsedAtom.context.conditionallyRunInAction(() {
      super.isMenuCollapsed = value;
      _$isMenuCollapsedAtom.reportChanged();
    }, _$isMenuCollapsedAtom, name: '${_$isMenuCollapsedAtom.name}_set');
  }

  final _$isMenuCardSelectedAtom = Atom(name: '_CardsStore.isMenuCardSelected');

  @override
  bool get isMenuCardSelected {
    _$isMenuCardSelectedAtom.context.enforceReadPolicy(_$isMenuCardSelectedAtom);
    _$isMenuCardSelectedAtom.reportObserved();
    return super.isMenuCardSelected;
  }

  @override
  set isMenuCardSelected(bool value) {
    _$isMenuCardSelectedAtom.context.conditionallyRunInAction(() {
      super.isMenuCardSelected = value;
      _$isMenuCardSelectedAtom.reportChanged();
    }, _$isMenuCardSelectedAtom, name: '${_$isMenuCardSelectedAtom.name}_set');
  }

  final _$cardDeckTitleAtom = Atom(name: '_CardsStore.cardDeckTitle');

  @override
  String get cardDeckTitle {
    _$cardDeckTitleAtom.context.enforceReadPolicy(_$cardDeckTitleAtom);
    _$cardDeckTitleAtom.reportObserved();
    return super.cardDeckTitle;
  }

  @override
  set cardDeckTitle(String value) {
    _$cardDeckTitleAtom.context.conditionallyRunInAction(() {
      super.cardDeckTitle = value;
      _$cardDeckTitleAtom.reportChanged();
    }, _$cardDeckTitleAtom, name: '${_$cardDeckTitleAtom.name}_set');
  }

  final _$selectedCardAtom = Atom(name: '_CardsStore.selectedCard');

  @override
  ScrumComplexity get selectedComplexity {
    _$selectedCardAtom.context.enforceReadPolicy(_$selectedCardAtom);
    _$selectedCardAtom.reportObserved();
    return super.selectedComplexity;
  }

  @override
  set selectedComplexity(ScrumComplexity value) {
    _$selectedCardAtom.context.conditionallyRunInAction(() {
      super.selectedComplexity = value;
      _$selectedCardAtom.reportChanged();
    }, _$selectedCardAtom, name: '${_$selectedCardAtom.name}_set');
  }

  final _$scrumCardsListAtom = Atom(name: '_CardsStore.scrumCardsList');

  @override
  List<ScrumCard> get scrumCardsList {
    _$scrumCardsListAtom.context.enforceReadPolicy(_$scrumCardsListAtom);
    _$scrumCardsListAtom.reportObserved();
    return super.scrumCardsList;
  }

  @override
  set scrumCardsList(List<ScrumCard> value) {
    _$scrumCardsListAtom.context.conditionallyRunInAction(() {
      super.scrumCardsList = value;
      _$scrumCardsListAtom.reportChanged();
    }, _$scrumCardsListAtom, name: '${_$scrumCardsListAtom.name}_set');
  }

  final _$_CardsStoreActionController = ActionController(name: '_CardsStore');

  @override
  void setFibonacci() {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.setFibonacci();
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStandardNumbers() {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.setStandardNumbers();
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTshirtSizes() {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.setTshirtSizes();
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCard() {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.resetCard();
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectComplexity(ScrumComplexity card) {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.selectComplexity(card);
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMenuStatus() {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.toggleMenuStatus();
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isMenuCollapsed: ${isMenuCollapsed.toString()},isMenuCardSelected: ${isMenuCardSelected.toString()},cardDeckTitle: ${cardDeckTitle.toString()},selectedCard: ${selectedComplexity.toString()},scrumCardsList: ${scrumCardsList.toString()}';
    return '{$string}';
  }
}
