import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './../presenter/calculator_presenter.dart';
import './widgets/build_operation_button.dart';


class CalculadoraView extends ConsumerWidget {
   CalculadoraView({super.key});

  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final resultado = ref.watch(calculadoraPresenterProvider).resultado;
    final presenter = ref.read(calculadoraPresenterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 1'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 2'),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildOperationButton(
                  presenter: presenter,
                  operation: '+',
                  num1Controller: _num1Controller,
                  num2Controller: _num2Controller,
                ),
                BuildOperationButton(
                  presenter: presenter,
                  operation: '-',
                  num1Controller: _num1Controller,
                  num2Controller: _num2Controller,
                ),
                BuildOperationButton(
                  presenter: presenter,
                  operation: '*',
                  num1Controller: _num1Controller,
                  num2Controller: _num2Controller,
                ),
                BuildOperationButton(
                  presenter: presenter,
                  operation: '/',
                  num1Controller: _num1Controller,
                  num2Controller: _num2Controller,
                ),
              ],
            ),
            const SizedBox(height: 30),

            const Text('Resultado:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              resultado,
              style: const TextStyle(fontSize: 32, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }


}