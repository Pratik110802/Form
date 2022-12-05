import 'package:flutter/material.dart';
import 'validation_inputs.dart';

class SignupValidation with ChangeNotifier {
  ValidationInput _name = ValidationInput('', '');
  ValidationInput _address = ValidationInput('', '');

  //Getters
  ValidationInput get Name => _name;
  ValidationInput get Address => _address;

  //Setters
  void changeName(String value) {
    if (value.length < 2) {
      _name = ValidationInput('', "*Required");
    } else {
      _name = ValidationInput(value, '');
    }
    notifyListeners();
  }

  void changeAddress(String value) {
    if (value.length < 2) {
      _address = ValidationInput('', "*Required");
    } else {
      _address = ValidationInput(value, '');
    }
    notifyListeners();
  }
}

class Gendercheck extends ChangeNotifier {
  bool ischecked = false;

  changeStatus() {
    ischecked = !ischecked;
    notifyListeners();
  }
}

class Boolcheck extends ChangeNotifier {
  bool istermchecked = false;

  changeStatus() {
    istermchecked = !istermchecked;
    notifyListeners();
  }
}
