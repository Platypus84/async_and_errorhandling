import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String text = 'Go';
  bool isLoading = false;

  Future<String> tripleText(String value) async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      return value + value + value;
    } catch (e) {
      return 'Error';
    }
  }

  void submit() async {
    setState(() {
      text = 'Go';
      isLoading = true;
    });

    text = await tripleText(text);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(
                  text,
                  style: TextStyle(fontSize: 24, color: Colors.purple),
                ),
                SizedBox(height: 24),
                Visibility(
                  visible: isLoading,
                  child: CircularProgressIndicator(),
                ),
                SizedBox(height: 24),
                FilledButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text('Press me'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
