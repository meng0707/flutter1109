import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/another_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
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
                  if (myname == null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Wait a Moment")));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnotherPage()));
                  }
                },
                child: const Text(
                  'AnotherPage',
                  style: TextStyle(color: Colors.tealAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
