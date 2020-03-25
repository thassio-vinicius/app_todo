import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'date_store.g.dart';

class DateStore = _DateStore with _$DateStore;

abstract class _DateStore with Store {
  @observable
  String date = DateTime.now().toUtc().toIso8601String();
  @observable
  String displayDate = 'Selecionar';
  @computed
  get settledDate => date;

  set currentDate(DateTime date) {
    String formatDate = "EE 'às'";

    if (date.difference(DateTime.now()).inDays == 0) {
      formatDate = "'hoje às'";
    }
    displayDate = DateFormat("$formatDate HH:mm", "pt_BR").format(date);
  }

  @action
  setDate(DateTime value, bool isNewTask) {
    if (value != null) {
      date = value.toUtc().toIso8601String();
    } else {
      date = DateTime.now().toUtc().toIso8601String();
    }

    String formatDate = "EE 'às'";

    if (value.difference(DateTime.now()).inDays == 0) {
      formatDate = "'hoje às'";
    }

    displayDate = DateFormat("$formatDate HH:mm", "pt_BR").format(value);

    print("Date new: $date");
  }
}
