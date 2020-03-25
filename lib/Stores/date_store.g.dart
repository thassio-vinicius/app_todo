// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DateStore on _DateStore, Store {
  Computed<dynamic> _$settledDateComputed;

  @override
  dynamic get settledDate =>
      (_$settledDateComputed ??= Computed<dynamic>(() => super.settledDate))
          .value;

  final _$dateAtom = Atom(name: '_DateStore.date');

  @override
  String get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$displayDateAtom = Atom(name: '_DateStore.displayDate');

  @override
  String get displayDate {
    _$displayDateAtom.context.enforceReadPolicy(_$displayDateAtom);
    _$displayDateAtom.reportObserved();
    return super.displayDate;
  }

  @override
  set displayDate(String value) {
    _$displayDateAtom.context.conditionallyRunInAction(() {
      super.displayDate = value;
      _$displayDateAtom.reportChanged();
    }, _$displayDateAtom, name: '${_$displayDateAtom.name}_set');
  }

  final _$_DateStoreActionController = ActionController(name: '_DateStore');

  @override
  dynamic setDate(DateTime value, bool isNewTask) {
    final _$actionInfo = _$_DateStoreActionController.startAction();
    try {
      return super.setDate(value, isNewTask);
    } finally {
      _$_DateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'date: ${date.toString()},displayDate: ${displayDate.toString()},settledDate: ${settledDate.toString()}';
    return '{$string}';
  }
}
