import 'package:calculo_imc/controller/masked_controller.dart';
import 'package:flutter/material.dart';

class CalculateImcController {
  double weight = 0;
  double height = 0;
  String formatedValue = '';

  TextEditingController heightController = MoneyMaskedTextController();
  TextEditingController weightController = MoneyMaskedTextController();
  final ValueNotifier<bool> _enableButton = ValueNotifier<bool>(false);
  final ValueNotifier<String> _resultImc =
      ValueNotifier<String>('Informe seus  dados');

  void setHeight(String value) {
    if (value.isNotEmpty) {
      height = double.parse(value) / 100;
      _enableButton.value = true;
    } else {
      _enableButton.value = false;
    }
  }

  void setWeight(String value) {
    if (value.isNotEmpty) {
      weight = double.parse(value) / 100;
    }
  }

  void calculateImc() {
    double result = weight / (height * height);
    messageImc(imc: result);
  }

  void clearButton() {
    heightController.clear();
    weightController.clear();
    _enableButton.value = false;
    _resultImc.value = 'Informe seus  dados ';
  }

  ValueNotifier<bool> get enableButtom => _enableButton;
  ValueNotifier<String> get resultImc => _resultImc;

  void messageImc({required double imc}) {
    if (imc < 18.5) {
      _resultImc.value =
          'Seu IMC é ${imc.toStringAsPrecision(2)}. Você esta classificado(a) em Magreza';
    } else if (imc > 18.5 && imc < 24.9) {
      _resultImc.value =
          'Seu IMC é ${imc.toStringAsPrecision(2)}. Você esta classificado(a) em Normal';
    } else if (imc > 24.9 && imc < 29.9) {
      _resultImc.value =
          'Seu IMC é ${imc.toStringAsPrecision(2)}. Você esta classificado(a) em Sobrepeso';
    } else if (imc > 29.9 && imc < 39.9) {
      _resultImc.value =
          'Seu IMC é ${imc.toStringAsPrecision(2)}. Você esta classificado(a) em Obesidade';
    } else if (imc > 40) {
      _resultImc.value =
          'Seu IMC é ${imc.toStringAsPrecision(2)}. Você esta classificado(a) em Obesidade grave';
    } else {
      _resultImc.value = 'Houve algum erro';
    }
  }
}
