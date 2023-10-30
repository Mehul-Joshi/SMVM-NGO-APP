import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(FormPage());

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      home: DropoutForm(),
    );
  }
}

class DropoutForm extends StatefulWidget {
  @override
  _DropoutFormState createState() => _DropoutFormState();
}

class _DropoutFormState extends State<DropoutForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropout Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'age',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: reasonController,
                decoration: InputDecoration(
                  labelText: 'Reason for Dropout',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the reason for dropout';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form fields are valid, you can process the data here
                    final email = emailController.text;
                    final name = nameController.text;
                    final age = ageController.text;
                    final reason = reasonController.text;

                    // Save the form data to Firestore
                    FirebaseFirestore.instance
                        .collection('record')
                        .add({
                          'email': email,
                          'name': name,
                          'age': age,
                          'reason': reason,
                        })
                        .then((value) => print("Form data added to Firestore"))
                        .catchError((error) => print("Error: $error"));

                    // You can handle or send this data as needed

                    // Clear the form fields
                    emailController.clear();
                    nameController.clear();
                    ageController.clear();
                    reasonController.clear();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
