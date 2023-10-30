import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:smvm/Login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.cyan[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30.0),
              Text(
                'JOIN SMVM',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {});
                  _password = value!;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = value!;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();

                    // Handle your signup logic here with the collected data
                    // For example, you can print the values:
                    print('Name: $_name');
                    print('Email: $_email');
                    print('Password: $_password');
                    print('Confirm Password: $_confirmPassword');

                    // Add your logic to create the user account or navigate to the next screen
                    // For example: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NextPage()));
                  }
                  _signUp();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan[700], // Button background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text('Sign Up'),
              ),
              SizedBox(height: 20.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();

                    // Handle your signup logic here with the collected data
                    // For example, you can print the values:
                    print('Name: $_name');
                    print('Email: $_email');
                    print('Password: $_password');
                    print('Confirm Password: $_confirmPassword');

                    // Add your logic to create the user account or navigate to the next screen
                    // For example: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NextPage()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan[700], // Button background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                ),
                child: Text('LOGIN'),
              ),
              SizedBox(height: 20.0),
              //               RaisedButton(child:Text("Login"),)
              // Other UI elements
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Navigate to another screen after successful signup
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print("Error during signup: $e");
      // Handle signup error
    }
  }
}
