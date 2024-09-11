import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:labshared_pref/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  String? myname;

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString('myName');
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void removeDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('myName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                myname ?? 'Wait a Moment',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  removeDate();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstPage()));
                },
                child: const Text('FirstPage',
                    style: TextStyle(color: Colors.tealAccent)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text('HomePage',
                    style: TextStyle(color: Colors.tealAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
