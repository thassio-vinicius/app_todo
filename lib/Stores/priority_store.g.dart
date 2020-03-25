// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PriorityStore on _PriorityStore, Store {
  Computed<String> _$settledPriorityComputed;

  @override
  String get settledPriority => (_$settledPriorityComputed ??=
          Computed<String>(() => super.settledPriority))
      .value;

  final _$priorityAtom = Atom(name: '_PriorityStore.priority');

  @override
  String get priority {
    _$priorityAtom.context.enforceReadPolicy(_$priorityAtom);
    _$priorityAtom.reportObserved();
    return super.priority;
  }

  @override
  set priority(String value) {
    _$priorityAtom.context.conditionallyRunInAction(() {
      super.priority = value;
      _$priorityAtom.reportChanged();
    }, _$priorityAtom, name: '${_$priorityAtom.name}_set');
  }

  final _$prioritiesAtom = Atom(name: '_PriorityStore.priorities');

  @override
  List<String> get priorities {
    _$prioritiesAtom.context.enforceReadPolicy(_$prioritiesAtom);
    _$prioritiesAtom.reportObserved();
    return super.priorities;
  }

  @override
  set priorities(List<String> value) {
    _$prioritiesAtom.context.conditionallyRunInAction(() {
      super.priorities = value;
      _$prioritiesAtom.reportChanged();
    }, _$prioritiesAtom, name: '${_$prioritiesAtom.name}_set');
  }

  final _$priorityIndexAtom = Atom(name: '_PriorityStore.priorityIndex');

  @override
  int get priorityIndex {
    _$priorityIndexAtom.context.enforceReadPolicy(_$priorityIndexAtom);
    _$priorityIndexAtom.reportObserved();
    return super.priorityIndex;
  }

  @override
  set priorityIndex(int value) {
    _$priorityIndexAtom.context.conditionallyRunInAction(() {
      super.priorityIndex = value;
      _$priorityIndexAtom.reportChanged();
    }, _$priorityIndexAtom, name: '${_$priorityIndexAtom.name}_set');
  }

  final _$_PriorityStoreActionController =
      ActionController(name: '_PriorityStore');

  @override
  dynamic setPriority(int index, bool isNewPriority) {
    final _$actionInfo = _$_PriorityStoreActionController.startAction();
    try {
      return super.setPriority(index, isNewPriority);
    } finally {
      _$_PriorityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'priority: ${priority.toString()},priorities: ${priorities.toString()},priorityIndex: ${priorityIndex.toString()},settledPriority: ${settledPriority.toString()}';
    return '{$string}';
  }
}
