import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController budgetController = TextEditingController();

  String result = ''; 
  bool smartphoneSelected = false;
  bool keyboardSelected = false;
  bool mouseSelected = false;
  bool monitorSelected = false;

  
  final int smartphonePrice = 200;
  final int keyboardPrice = 5;
  final int mousePrice = 15;
  final int monitorPrice = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exame'),
        centerTitle: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            MyTextField(controller: budgetController, hint: "Enter your budget"),
            SizedBox(height: 10),
            
        
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: smartphoneSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          smartphoneSelected = value ?? false;
                        });
                      },
                    ),
                    Text('Smartphone (200\$)'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: keyboardSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          keyboardSelected = value ?? false;
                        });
                      },
                    ),
                    Text('Keyboard (5\$)'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: mouseSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          mouseSelected = value ?? false;
                        });
                      },
                    ),
                    Text('Mouse (15\$)'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: monitorSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          monitorSelected = value ?? false;
                        });
                      },
                    ),
                    Text('Monitor (120\$)'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    try {
                      int budget = int.parse(budgetController.text);
                      int totalPrice = 0;

                      
                      if (smartphoneSelected) totalPrice += smartphonePrice;
                      if (keyboardSelected) totalPrice += keyboardPrice;
                      if (mouseSelected) totalPrice += mousePrice;
                      if (monitorSelected) totalPrice += monitorPrice;

                      
                      if (budget >= totalPrice) {
                        int remainingMoney = budget - totalPrice;
                        result = 'You can buy these items and still have \$${remainingMoney}.';
                      } else {
                        int neededMoney = totalPrice - budget;
                        result = 'You need an additional \$${neededMoney} to buy these items.';
                      }
                    } catch (e) {
                      result = 'Please enter a valid number for the budget.';
                    }
                  });
                },
                child: Text('Check'),
              ),
            ),
            SizedBox(height: 20),

            // Result text
            Center(
              child: Text(
                result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 60,
      child: TextField(
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: hint),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );       
  }
}

