import 'package:flutter/material.dart';
import './../../presenter/calculator_presenter.dart';

class BuildOperationButton extends StatelessWidget {
  final CalculadoraPresenter presenter;
  final String operation;
  final TextEditingController num1Controller;
  final TextEditingController num2Controller;

  const BuildOperationButton({
    super.key,
    required this.presenter,
    required this.operation,
    required this.num1Controller,
    required this.num2Controller,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        presenter.realizarOperacion(
          num1Controller.text,
          num2Controller.text,
          operation,
        );
      },
      child: Text(operation, style: const TextStyle(fontSize: 24)),
    );
  }
}