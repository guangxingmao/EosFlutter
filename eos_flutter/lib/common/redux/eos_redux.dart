import 'package:eos_flutter/common/model/eos.dart';
import 'package:redux/redux.dart';

final EosReducer = combineReducers<Eos>([
  TypedReducer<Eos, UpdateEosAction>(_updateLoaded),
]);

Eos _updateLoaded(Eos eos, action) {
  eos = action.eos;
  return eos;
}

class UpdateEosAction {
  final Eos eos;

  UpdateEosAction(this.eos);
}
