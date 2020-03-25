import 'package:mobx/mobx.dart';

part 'priority_store.g.dart';

class PriorityStore = _PriorityStore with _$PriorityStore;

abstract class _PriorityStore with Store {
  @observable
  String priority = 'Selecionar';

  @observable
  List<String> priorities = [
    'Nenhuma',
    'Baixa(!)',
    'Média(!!)',
    'Alta(!!!)',
  ];

  @observable
  int priorityIndex = 0;

  @computed
  String get settledPriority => '${priorities[priorityIndex]}';

  set currentPriority(String priority) => this.priority = priority;

  @action
  setPriority(int index, bool isNewPriority) {
    priorityIndex = index;

    priority = priorities[index];

    print(priority);
    print(priorityIndex);
  }
}
