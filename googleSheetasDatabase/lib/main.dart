import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheet Form',
      theme: ThemeData(primarySwatch: Colors.green),
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Map to hold all form fields dynamically
  final Map<String, TextEditingController> controllers = {
    "name": TextEditingController(),
    "age": TextEditingController(),
  };

  final String webAppUrl = "https://script.google.com/macros/s/AKfycbykfCHHgmsta2s7eqfHIIoSu4OulsE1tKsGxoCn3-B12o745gp_uYtVFzXYqy5onG-V/exec"; // Replace with your URL
  bool isLoading = false;

  @override
  void dispose() {
    controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      // Collect form data
      final formData =
      controllers.map((key, controller) => MapEntry(key, controller.text));

      try {
        final response = await http.post(
          Uri.parse(webAppUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(formData),
        );

        setState(() => isLoading = false);

        // Treat 200–399 as success (includes 302 redirect)
        if (response.statusCode >= 200 && response.statusCode < 400) {
          // Clear form
          controllers.forEach((key, controller) => controller.clear());
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Success"),
              content: Text("Form submitted successfully!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                )
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Error"),
              content: Text(
                  "Submission failed! Status Code: ${response.statusCode}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                )
              ],
            ),
          );
        }
      } catch (e) {
        setState(() => isLoading = false);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred: $e"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              )
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Sheet Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ...controllers.entries.map(
                    (entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: entry.value,
                    decoration: InputDecoration(
                      labelText: entry.key[0].toUpperCase() +
                          entry.key.substring(1), // Capitalize
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: entry.key == "age"
                        ? TextInputType.number
                        : TextInputType.text,
                    validator: (value) =>
                    value!.isEmpty ? "Please enter ${entry.key}" : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
