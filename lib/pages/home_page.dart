import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  final String _heightTxt = "Height(Foot)";
  final String _heightExp = "Exp: 5.85";
  final String _weightText = "Weight(Kg)";
  final String _weightExp = "Exp: 60";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: AppConstants.accentHexcolor, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: AppConstants.mainHexcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //** Height */
                Column(
                  children: [
                    Text(
                      _heightTxt,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppConstants.accentHexcolor),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: AppConstants.accentHexcolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: _heightController,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: _heightExp,
                          hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //** Weight */
                Column(
                  children: [
                    Text(
                      _weightText,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppConstants.accentHexcolor),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: AppConstants.accentHexcolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: _weightController,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: _weightExp,
                          hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            //** Calculate Text */
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                //** Converting foot to meter */
                _h = _h * 0.3048;

                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult >= 30)
                    _textResult = "You\'re obese";
                  else if (_bmiResult > 25 && _bmiResult < 30)
                    _textResult = "You\'re over weight";
                  else if (_bmiResult >= 18.5 && _bmiResult <= 25)
                    _textResult = "You have normal weight";
                  else
                    _textResult = "You are under weight";
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.accentHexcolor),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //** BMI result */
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                    color: AppConstants.accentHexcolor),
              ),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: AppConstants.accentHexcolor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _textResult = "";
                        _bmiResult = 0;
                        _heightController.text = "";
                        _weightController.text = "";
                      });
                    },
                    child: Container(
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppConstants.accentHexcolor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //** Left Side */
            const SizedBox(height: 80),
            const Bar(barWidth: 40),
            const SizedBox(height: 20),
            const Bar(barWidth: 70),
            const SizedBox(height: 20),
            const Bar(barWidth: 40),
            //** Right Side */
            const SizedBox(height: 20),
            const Bar(barWidth: 40, isLeftAxisAlignment: false),
            const SizedBox(height: 20),
            const Bar(barWidth: 70, isLeftAxisAlignment: false),
            const SizedBox(height: 20),
            const Bar(barWidth: 40, isLeftAxisAlignment: false),
          ],
        ),
      ),
    );
  }
}
