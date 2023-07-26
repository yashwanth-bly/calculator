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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Row(

              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontSize: 85,
                      color: Colors.white,

                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: 'AC',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '+/-',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '%',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(215, 166, 8, 20),
                  buttonText: '÷',
                  textColor: Colors.white,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '7',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '8',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '9',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(215, 166, 8, 20),
                  buttonText: 'X',
                  textColor: Colors.white,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '4',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '5',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '6',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(215, 166, 8, 20),
                  buttonText: '-',
                  textColor: Colors.white,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '1',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '2',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '3',
                  textColor: Colors.black87,
                ),
                Button(
                  buttonColor: Color.fromRGBO(215, 166, 8, 20),
                  buttonText: '+',
                  textColor: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                const Button(
                  buttonColor: Color.fromRGBO(243, 243, 243, 10),
                  buttonText: '.',
                  textColor: Colors.black87,
                ),
                const Button(
                  buttonColor: Color.fromRGBO(215, 166, 8, 20),
                  buttonText: '=',
                  textColor: Colors.white,
                ),
              ],
            )
          ],
        ));
  }
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      required this.textColor});
  final Color buttonColor;
  final String buttonText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      // color: buttonColor,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(78, 78),
          shape: const CircleBorder(),
          backgroundColor: buttonColor,
        ),
        child: Text(
          '$buttonText',
          style: TextStyle(fontSize: 32, color: textColor),
        ),
      ),
    );
  }
}
