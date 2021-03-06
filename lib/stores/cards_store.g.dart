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

  final _$selectedEstimationValueAtom =
      Atom(name: '_CardsStore.selectedEstimationValue');

  @override
  EstimationValue get selectedEstimationValue {
    _$selectedEstimationValueAtom.context
        .enforceReadPolicy(_$selectedEstimationValueAtom);
    _$selectedEstimationValueAtom.reportObserved();
    return super.selectedEstimationValue;
  }

  @override
  set selectedEstimationValue(EstimationValue value) {
    _$selectedEstimationValueAtom.context.conditionallyRunInAction(() {
      super.selectedEstimationValue = value;
      _$selectedEstimationValueAtom.reportChanged();
    }, _$selectedEstimationValueAtom,
        name: '${_$selectedEstimationValueAtom.name}_set');
  }

  final _$estimationValueListAtom =
      Atom(name: '_CardsStore.estimationValueList');

  @override
  List<EstimationValue> get estimationValueList {
    _$estimationValueListAtom.context
        .enforceReadPolicy(_$estimationValueListAtom);
    _$estimationValueListAtom.reportObserved();
    return super.estimationValueList;
  }

  @override
  set estimationValueList(List<EstimationValue> value) {
    _$estimationValueListAtom.context.conditionallyRunInAction(() {
      super.estimationValueList = value;
      _$estimationValueListAtom.reportChanged();
    }, _$estimationValueListAtom,
        name: '${_$estimationValueListAtom.name}_set');
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
  void selectComplexity(EstimationValue complexity) {
    final _$actionInfo = _$_CardsStoreActionController.startAction();
    try {
      return super.selectComplexity(complexity);
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
        'isMenuCollapsed: ${isMenuCollapsed.toString()},isMenuCardSelected: ${isMenuCardSelected.toString()},cardDeckTitle: ${cardDeckTitle.toString()},selectedEstimationValue: ${selectedEstimationValue.toString()},estimationValueList: ${estimationValueList.toString()}';
    return '{$string}';
  }
}
