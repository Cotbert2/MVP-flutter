import 'package:flutter_riverpod/flutter_riverpod.dart';
import './../model/calculator_model.dart';


class CalculadoraState {
  final String resultado;
  const CalculadoraState({this.resultado = '0.0'});
}

class CalculadoraPresenter extends StateNotifier<CalculadoraState> {
  final CalculatorModel _model;

  CalculadoraPresenter(this._model) : super(const CalculadoraState());

  void realizarOperacion(String num1Text, String num2Text, String operacion) {
    final num1 = double.tryParse(num1Text) ?? 0.0;
    final num2 = double.tryParse(num2Text) ?? 0.0;
    
    double resultadoCalculado;
    switch (operacion) {
      case '+':
        resultadoCalculado = _model.sumar(num1, num2);
        break;
      case '-':
        resultadoCalculado = _model.restar(num1, num2);
        break;
      case '*':
        resultadoCalculado = _model.multiplicar(num1, num2);
        break;
      case '/':
        resultadoCalculado = _model.dividir(num1, num2);
        break;
      default:
        state = const CalculadoraState(resultado: 'Error de operación');
        return;
    }

    String resultadoFormateado;
    if (resultadoCalculado.isNaN) {
      resultadoFormateado = 'Error: División por cero';
    } else {
      resultadoFormateado = resultadoCalculado == resultadoCalculado.toInt()
          ? resultadoCalculado.toInt().toString()
          : resultadoCalculado.toStringAsFixed(2);
    }
    
    state = CalculadoraState(resultado: resultadoFormateado);
  }
}

final calculadoraPresenterProvider = StateNotifierProvider<
    CalculadoraPresenter, CalculadoraState>((ref) {
  return CalculadoraPresenter(CalculatorModel());
});