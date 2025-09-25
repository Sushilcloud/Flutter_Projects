import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'child.dart';
import 'parent.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Simulated children for testing
  final List<Map<String, String>> children = [
    {"id": "child_001", "name": "Alice"},
    {"id": "child_002", "name": "Bob"},
    {"id": "child_003", "name": "Charlie"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Child-Parent Tracker",
      home: HomeScreen(children: children),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> children;

  const HomeScreen({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Child-Parent Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Launch parent app
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ParentApp(),
                  ),
                );
              },
              child: const Text("Open Parent Map"),
            ),
            const SizedBox(height: 20),
            ...children.map((child) {
              return ElevatedButton(
                onPressed: () {
                  // Launch each child app individually
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChildApp(
                        childId: child['id']!,
                        childName: child['name']!,
                      ),
                    ),
                  );
                },
                child: Text("Launch Child: ${child['name']}"),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
