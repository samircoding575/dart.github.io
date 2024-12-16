import 'package:flutter/material.dart';
import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> books = [
    '1984',
    'Manuscript Found in Accra',
    'Powerless',
    'None of the books',
  ];
  String selectedBook = '1984';
  TextEditingController totalPagesController = TextEditingController();
  TextEditingController pagesReadController = TextEditingController();
  TextEditingController pagesPerUnitController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String readingSpeed = 'hour';
  bool calculateDaysAndWeeks = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Reading Tracker'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedBook,
                onChanged: (value) {
                  setState(() {
                    selectedBook = value!;
                  });
                },
                items: books.map((book) {
                  return DropdownMenuItem(
                    value: book,
                    child: Text(book),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              MyTextField(
                  controller: totalPagesController,
                  hint: 'Enter Total Number of Pages'),
              const SizedBox(height: 10),
              MyTextField(
                  controller: pagesReadController,
                  hint: 'Enter Pages Read So Far'),
              const SizedBox(height: 10),
              MyTextField(
                  controller: pagesPerUnitController,
                  hint: 'Pages Read Per Hour/Day/Week'),
              const SizedBox(height: 10),
              const Text(
                'Reading Speed:',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'hour',
                    groupValue: readingSpeed,
                    onChanged: (value) {
                      setState(() {
                        readingSpeed = value.toString();
                      });
                    },
                  ),
                  const Text('Hour'),
                  Radio(
                    value: 'day',
                    groupValue: readingSpeed,
                    onChanged: (value) {
                      setState(() {
                        readingSpeed = value.toString();
                      });
                    },
                  ),
                  const Text('Day'),
                  Radio(
                    value: 'week',
                    groupValue: readingSpeed,
                    onChanged: (value) {
                      setState(() {
                        readingSpeed = value.toString();
                      });
                    },
                  ),
                  const Text('Week'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: calculateDaysAndWeeks,
                    onChanged: (value) {
                      setState(() {
                        calculateDaysAndWeeks = value!;
                      });
                    },
                  ),
                  const Text('Calculate Days/Weeks per Hour'),
                ],
              ),
              const SizedBox(height: 10),
              MyTextField(controller: notesController, hint: 'Enter Notes'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  final int totalPages =
                      int.tryParse(totalPagesController.text) ?? 0;
                  final int pagesRead =
                      int.tryParse(pagesReadController.text) ?? 0;
                  final int pagesPerUnit =
                      int.tryParse(pagesPerUnitController.text) ?? 0;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page2(
                        bookName: selectedBook,
                        notes: notesController.text,
                        totalPages: totalPages,
                        pagesRead: pagesRead,
                        pagesPerUnit: pagesPerUnit,
                        readingSpeed: readingSpeed,
                        calculateDaysAndWeeks: calculateDaysAndWeeks,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next'),
              ),
            ],
          ),
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
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}
