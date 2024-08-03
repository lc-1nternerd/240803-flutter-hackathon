import 'package:flutter/cupertino.dart';

enum ControlType {
  drag,
  mine,
  conveyor,
  machine,
}

class ControlModel extends ChangeNotifier {
  static final ControlModel _controlModel = ControlModel._internal();

  factory ControlModel() {
    return _controlModel;
  }

  ControlModel._internal();

  ControlType _controlType = ControlType.mine;

  ControlType get controlType => _controlType;

  set controlType(ControlType controlType) {
    _controlType = controlType;
    notifyListeners();
  }
}
