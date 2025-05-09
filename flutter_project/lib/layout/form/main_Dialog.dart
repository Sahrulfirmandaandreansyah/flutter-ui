import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Form'),
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
  String sex = "pria";
  bool isChecked = false;
  TextEditingController dateController = TextEditingController();

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
            // TextField Widget
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

            // DropdownButton Widget
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

            // Switch Widget
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

            // Radio Buttons Widget
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
            const SizedBox(height: 20),

            // Checkbox Widget
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        isChecked = value;
                        print("Setuju: $isChecked");
                      }
                    });
                  },
                ),
                const SizedBox(width: 4),
                const Text(
                  "Setuju syarat dan ketentuan.",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Date Picker Widget
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
                setState(() {
                  if (pickedDate != null) {
                    dateController.text = pickedDate.toString();
                  }
                });
                debugPrint("Date Picker: $pickedDate");
              },
              child: TextFormField(
                controller: dateController,
                maxLength: 20,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: "Tanggal Lahir",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  suffixIcon: Icon(Icons.date_range),
                  helperText: "Pilih tanggal lahir anda",
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 20),

            // Dialog Widget
            ElevatedButton(
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Info'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [Text('Your order was placed.')],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Open Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
