import 'package:flutter/material.dart';
import 'package:smvm/Home.dart';
import 'package:smvm/Registration.dart';

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DonationPage(),
    );
  }
}

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String selectedPaymentMethod = 'Google Pay';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardPinController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate to SMVM NGO'),
        backgroundColor: Colors.cyan[600],
        actions: <Widget>[
          if (selectedPaymentMethod == 'Google Pay')
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
                  // Navigate to another page or perform additional actions
                },
                child: Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: selectedPaymentMethod == 'Google Pay'
                  // ? Image.asset(
                  //     'assets/images/QR.svg', // Replace with your QR code asset
                  //     height: 200.0,
                  //     fit: BoxFit.cover,
                  //   )
                  ? Center(
                      child: Image.asset(
                        'assets/images/saenz-texas.gif', // Replace with your GIF asset
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Donation Amount',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Method of Donation',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButton<String>(
                    value: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                    items: <String>[
                      'Google Pay',
                      'Card Details',
                      'Cash Pay',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.0),
                  if (selectedPaymentMethod == 'Card Details')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Cardholder Name',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Card Number',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter card number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Card PIN',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: cardPinController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter card PIN',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  if (selectedPaymentMethod == 'Cash Pay')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Additional Note',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Enter any additional notes',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle donation submission
                      final donationAmount = amountController.text;
                      final paymentMethod = selectedPaymentMethod;
                      final cardholderName = nameController.text;
                      final cardNumber = cardNumberController.text;
                      final cardPin = cardPinController.text;
                      final phoneNumber = phoneNumberController.text;
                      final email = emailController.text;

                      // You can implement your donation logic here

                      // Display a confirmation dialog or navigate to a thank you page
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Donation Successful'),
                            content: Text(
                              'Thank you for your donation of $donationAmount via $paymentMethod.\n\n'
                              'Name: $cardholderName\n'
                              'Card Number: $cardNumber\n'
                              'Card PIN: $cardPin\n'
                              'Phone Number: $phoneNumber\n'
                              'Email: $email\n',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Navigate to another page or perform additional actions
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Donate'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dispose of controllers when the widget is removed
@override
void dispose() {
  var nameController;
  nameController.dispose();
  var cardNumberController;
  cardNumberController.dispose();
  var cardPinController;
  cardPinController.dispose();
  var amountController;
  amountController.dispose();
  var phoneNumberController;
  phoneNumberController.dispose();
  var emailController;
  emailController.dispose();
}

void main() {
  runApp(Donation());
}
