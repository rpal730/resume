import 'package:flutter/material.dart';
import 'package:resume/config/core/enums/state_enums.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
