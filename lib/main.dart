import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HW2',
      home: Scaffold(
        appBar: AppBar(title: Text("Calculator"),),
        body: CalculatWidget(),
      ),
    );
  }
}
class CalculatWidget extends StatefulWidget{
  @override
  _CalcState createState() {
    return _CalcState();
  }
}
class _CalcState extends State<CalculatWidget>{
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  dynamic _sum = 0;
  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return int.tryParse(result) != null;
  }
  void _add() {
    try{
      if (_isNumeric(num1Controller.text) == true || _isNumeric(num2Controller.text)) {
        setState(() {
          _sum =
              int.parse(num1Controller.text) + int.parse(num2Controller.text);
        });
      } 
    }
    catch(e) {
      print("can not added string");
    }
  }
  void _sub() {
    try{
      if (_isNumeric(num1Controller.text) == true || _isNumeric(num2Controller.text)) {
        setState(() {
          _sum =
              int.parse(num1Controller.text) - int.parse(num2Controller.text);
        });
      }
    }
    catch(e) {
      print("can not subtract string");
    }
  }
  void _mult() {
    try{
      if (_isNumeric(num1Controller.text) == true || _isNumeric(num2Controller.text)) {
        setState(() {
          _sum =
              int.parse(num1Controller.text) * int.parse(num2Controller.text);
        });
      }
    }
    catch(e) {
      print("can not multiply string");
    }
  }
  void _division() {
    try {
      if (num2Controller.text != "0" ||
          _isNumeric(num1Controller.text) == false ||
          _isNumeric(num2Controller.text) == false) {
        setState(() {
          _sum = double.parse(num1Controller.text) /
              double.parse(num2Controller.text);
        });
      }
    }
    on IntegerDivisionByZeroException {
      print('Cannot divide by zero');
    }
    catch (e) {
      print("can not divide string");
    }
  }
  void _clear() {
    setState(() {
      num1Controller.text = "0";
      num2Controller.text = "0";
      _sum = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: num1Controller,),
        TextField(controller: num2Controller,),
        Text('Result= $_sum'),

        Row(
          children: [
            FlatButton(onPressed:_add,
                color: Colors.blueAccent,
                child: Text("Add")),
            FlatButton(
                onPressed: _mult,
                color: Colors.greenAccent,
                child: Text("Multipliction")),
            FlatButton(
                onPressed: _sub,
                color: Colors.yellow,
                child: Text("Subtraction")),
            FlatButton(
                onPressed: _division,
                color: Colors.lightGreenAccent,
                child: Text("Division")),
          ],
        ),
        FlatButton(
            onPressed: _clear,
            color: Colors.orange,
            child: Text(
                "Clear")),
      ],
    );
  }
}