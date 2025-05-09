import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Widgets Example'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  String selected = "Dart";
  bool isOn = false;
  String sex = "pria"; // Default value for sex

  final List<String> dropDownList = const [
    "Dart",
    "Kotlin",
    "Java",
    "Javascript",
    "PHP",
    "Python",
    "Ruby",
    "Swift",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: textController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: "Nama",
                labelStyle: TextStyle(color: Colors.blueGrey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                helperText: "Masukkan nama",
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Bahasa favorit: "),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selected,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 20,
                  style: TextStyle(color: Colors.blue[600]),
                  underline: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 3),
                      ),
                    ),
                  ),
                  items:
                      dropDownList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged: (val) {
                    setState(() {
                      if (val != null) selected = val;
                      print(selected);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Connect Instagram"),
                Switch(
                  value: isOn,
                  onChanged: (bool? val) {
                    if (val != null) {
                      setState(() {
                        isOn = val;
                        print("Switch: $isOn");
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Jenis Kelamin: "),
                const SizedBox(width: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: 'pria',
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            sex = value;
                            print("sex: $sex");
                          }
                        });
                      },
                    ),
                    const Text("Pria"),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: "wanita",
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            sex = value;
                            print("sex: $sex");
                          }
                        });
                      },
                    ),
                    const Text("Wanita"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
