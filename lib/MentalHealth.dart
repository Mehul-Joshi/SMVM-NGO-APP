import 'package:flutter/material.dart';
import 'package:smvm/chatbot.dart';

class MentalHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MentalHealthPage(),
    );
  }
}

class MentalHealthPage extends StatelessWidget {
  final List<Color> cardColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.amber,
    Colors.deepPurple,
    Colors.pink,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Page'),
        backgroundColor: Colors.cyan[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              // child: TextButton(
              //   onPressed: () {
              //     // Navigate to another page or perform additional actions
              //   },
              //   // child: Text(
              //   //   'Back',
              //   //   style: TextStyle(
              //   //     color: Colors.cyan[600],
              //   //   ),
              //   // ),
              // ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Hello your Mental Health matters',
                  style: TextStyle(fontSize: 20),
                )),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cards per row
                childAspectRatio: 1.2, // Aspect ratio for square-shaped cards
              ),
              itemCount: cardColors.length,
              itemBuilder: (context, index) {
                final cardColor = cardColors[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChatBot()));
                    // Handle card click, e.g., navigate to another page
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        'Mental Health ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to another page or perform additional actions
                },
                child: Text('Go to Other Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
