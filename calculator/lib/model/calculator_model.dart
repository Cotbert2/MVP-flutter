class CalculatorModel {
  double sumar(double a, double b) => a + b;
  double restar(double a, double b) => a - b;
  double multiplicar(double a, double b) => a * b;
  double dividir(double a, double b) {
    if (b == 0) {
      return double.nan;
    }
    return a / b;
  }
}