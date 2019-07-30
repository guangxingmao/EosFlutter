import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final ThemeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, UpdateThemeDataAction>(_updateLoaded),
]);

ThemeData _updateLoaded(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

class UpdateThemeDataAction {
  final ThemeData themeData;

  UpdateThemeDataAction(this.themeData);
}
