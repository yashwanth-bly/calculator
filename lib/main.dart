import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? x;
  int? y;
  String total = '';
  Operator? operator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  _getValue(),
                  style: const TextStyle(
                    fontSize: 85,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              Button(
                buttonText: 'AC',
                textColor: Colors.black87,
                onTap: () {
                  setState(() {
                    x = null;
                    y = null;
                    operator = null;
                  });
                },
              ),
              Button(
                buttonText: '+/-',
                textColor: Colors.black87,
                onTap: () {},
              ),
              Button(
                buttonText: '%',
                textColor: Colors.black87,
                onTap: () {
                  setOperator(Operator.percentage);
                },
              ),
              Button(
                buttonColor: const Color.fromRGBO(215, 166, 8, 20),
                buttonText: '÷',
                textColor: Colors.white,
                onTap: () {
                  setOperator(Operator.division);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              Button(
                buttonText: '7',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(7);
                },
              ),
              Button(
                buttonText: '8',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(8);
                },
              ),
              Button(
                buttonText: '9',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(9);
                },
              ),
              Button(
                buttonColor: const Color.fromRGBO(215, 166, 8, 20),
                buttonText: 'X',
                textColor: Colors.white,
                onTap: () {
                  setOperator(Operator.multiply);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              Button(
                buttonText: '4',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(4);
                },
              ),
              Button(
                buttonText: '5',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(5);
                },
              ),
              Button(
                buttonText: '6',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(6);
                },
              ),
              Button(
                buttonColor: const Color.fromRGBO(215, 166, 8, 20),
                buttonText: '-',
                textColor: Colors.white,
                onTap: () {
                  setOperator(Operator.subtract);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              Button(
                buttonText: '1',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(1);
                },
              ),
              Button(
                buttonText: '2',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(2);
                },
              ),
              Button(
                buttonText: '3',
                textColor: Colors.black87,
                onTap: () {
                  onNumberTap(3);
                },
              ),
              Button(
                buttonColor: const Color.fromRGBO(215, 166, 8, 20),
                buttonText: '+',
                textColor: Colors.white,
                onTap: () {
                  setOperator(Operator.add);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50),
                      left: Radius.circular(50),
                    ),
                    color: Color.fromRGBO(243, 243, 243, 10),
                  ),
                  height: 75,
                  width: 180,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 50, 10),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 32, color: Colors.black87),
                    ),
                  ),
                ),
                onTap: () {},
              ),
              Button(
                buttonText: '.',
                textColor: Colors.black87,
                onTap: () {},
              ),
              Button(
                buttonColor: const Color.fromRGBO(215, 166, 8, 20),
                buttonText: '=',
                textColor: Colors.white,
                onTap: () {
                  _calculateTotal();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void setOperator(Operator op) {
    setState(() {
      operator = op;
    });
  }

  void onNumberTap(int i) {
    print('ontap $i');
    if (operator == null) {
      setState(() {
        x = i;
      });
    } else {
      setState(() {
        y = i;
      });
    }
  }

  String _getValue() {
    if (x == null) {
      return '0';
    }
    if (operator == null) {
      return x.toString();
    }
    if (y == null) {
      return '$x ${operatorValue()}';
    }

    return '$x ${operatorValue()} $y $total';
  }

  operatorValue() {
    switch (operator!) {
      case Operator.add:
        return '+';
      case Operator.subtract:
        return '-';
      case Operator.multiply:
        return '*';
      case Operator.division:
        return '/';
      case Operator.percentage:
        return '%';
    }
  }

  void _calculateTotal() {
    if (x != null && y != null && operator != null) {
      setState(() {
        switch (operator!) {
          case Operator.add:
            total = '=${x! + y!}';
          case Operator.subtract:
            total = '=${x! - y!}';
          case Operator.multiply:
            total = '=${x! * y!}';
          case Operator.division:
            total = '=${x! / y!}';
          case Operator.percentage:
            total = '=${x! % y!}';
        }
      });
    }
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.buttonColor,
    required this.buttonText,
    required this.textColor,
    required this.onTap,
  });
  final Color? buttonColor;
  final String buttonText;
  final Color textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      // color: buttonColor,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(78, 78),
          shape: const CircleBorder(),
          backgroundColor:
              buttonColor ?? const Color.fromRGBO(243, 243, 243, 10),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 32, color: textColor),
        ),
      ),
    );
  }
}

enum Operator { add, subtract, multiply, division, percentage }
