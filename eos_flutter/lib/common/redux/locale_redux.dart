import 'dart:ui';

import 'package:redux/redux.dart';

final LocaleReducer = combineReducers<Locale>([
  TypedReducer<Locale, UpdateLocaleAction>(_updateLoaded),
]);

Locale _updateLoaded(Locale locale, action) {
  locale = action.locale;
  return locale;
}

class UpdateLocaleAction {
  final Locale locale;

  UpdateLocaleAction(this.locale);
}
