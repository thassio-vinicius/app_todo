import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class _CupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'pt';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      BrazilianCupertinoLocalization.load(locale);

  @override
  bool shouldReload(_CupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(pt_BR)';
}

class BrazilianCupertinoLocalization implements CupertinoLocalizations {
  const BrazilianCupertinoLocalization();

  static const List<String> _shortWeekdays = <String>[
    'seg',
    'ter',
    'qua',
    'qui',
    'sex',
    'sáb',
    'dom',
  ];

  static const List<String> _shortMonths = <String>[
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez',
  ];

  static const List<String> _months = <String>[
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => hour.toString() + " Uhr";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) return '1 Minuto';
    return minute.toString() + ' Minutos';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get todayLabel => 'Hoje';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get alertDialogLabel => 'Info';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? 'Hora' : 'Horas';

  @override
  String timerPickerMinuteLabel(int minute) => 'Min';

  @override
  String timerPickerSecondLabel(int second) => 'Seg';

  @override
  String get cutButtonLabel => 'Recortar';

  @override
  String get copyButtonLabel => 'Copiar';

  @override
  String get pasteButtonLabel => 'Colar';

  @override
  String get selectAllButtonLabel => 'Selecionar Tudo';

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
        const BrazilianCupertinoLocalization());
  }

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _CupertinoLocalizationsDelegate();
}
