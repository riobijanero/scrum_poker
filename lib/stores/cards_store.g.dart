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
    _$isMenuCardSelectedAtom.context
        .enforceReadPolicy(_$isMenuCardSelectedAtom);
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

  final _$selectedCardAtom = Atom(name: '_CardsStore.selectedCard');

  @override
  ScrumCard get selectedCard {
    _$selectedCardAtom.context.enforceReadPolicy(_$selectedCardAtom);
    _$selectedCardAtom.reportObserved();
    return super.selectedCard;
  }

  @override
  set selectedCard(ScrumCard value) {
    _$selectedCardAtom.context.conditionallyRunInAction(() {
      super.selectedCard = value;
      _$selectedCardAtom.reportChanged();
    }, _$selectedCardAtom, name: '${_$selectedCardAtom.name}_set');
  }

  final _$_CardsStoreActionController = ActionController(name: '_CardsStore');

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
  void selectCard(ScrumCard card) {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.selectCard(card);
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
        'isMenuCollapsed: ${isMenuCollapsed.toString()},isMenuCardSelected: ${isMenuCardSelected.toString()},selectedCard: ${selectedCard.toString()}';
    return '{$string}';
  }
}
