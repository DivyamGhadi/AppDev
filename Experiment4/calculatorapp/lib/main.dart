import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = "";
  String _output = "0";

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _expression = "";
        _output = "0";
      } else if (value == "=") {
        if (_expression.isEmpty) return;

        try {
          Parser p = Parser();
          Expression exp = p.parse(_expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          _output = eval.toString();
          _expression = _output;
        } catch (e) {
          _output = "0";
          _expression = "";
        }
      } else {
        // Prevent two operators in a row
        if (_expression.isNotEmpty &&
            "+-*/".contains(value) &&
            "+-*/".contains(_expression[_expression.length - 1])) {
          return;
        }
        _expression += value;
        _output = _expression;
      }
    });
  }

  Widget _buildButton(String text, {Color? color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.blueGrey[800],
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () => _buttonPressed(text),
          child: Text(text, style: const TextStyle(fontSize: 24, color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/", color: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("*", color: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-", color: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("0"),
              _buildButton("C", color: Colors.red),
              _buildButton("=", color: Colors.green),
              _buildButton("+", color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
