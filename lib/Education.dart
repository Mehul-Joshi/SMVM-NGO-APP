import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smvm/Form.dart';

class Education extends StatefulWidget {
  const Education({Key? key});

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMVM"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                height: 300, // Adjust the height as needed
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        title: 'Financial',
                        value: 40,
                        color: const Color(0xff0293ee),
                      ),
                      PieChartSectionData(
                        title: 'Other',
                        value: 10,
                        color: const Color(0xfff8b250),
                      ),
                      PieChartSectionData(
                        title: 'Family',
                        value: 20,
                        color: const Color(0xff845bef),
                      ),
                      PieChartSectionData(
                        title: 'Pressure of Education / Family',
                        value: 30,
                        color: const Color(0xff13d38e),
                      ),
                    ],
                  ),
                )),
          ),
          Center(
            child: Text(
              'List Of Student',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('record').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                var documents = snapshot.data?.docs;
                List<Widget> data = [];
                for (var document in documents!) {
                  var documentData = document.data() as Map<String, dynamic>;
                  data.add(
                    Card(
                      elevation: 8.0,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    width: 1.0, color: Colors.white24),
                              ),
                            ),
                            child: Text(
                              documentData['email'],
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          title: Text(
                            " Name : " +
                                documentData['name'] +
                                "         " +
                                " Age : " +
                                documentData['age'] +
                                "         " +
                                "Dropout Reason : " +
                                documentData['reason'],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return ListView(children: data);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Replace 'FormPage' with the actual page you want to navigate to
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormPage(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Future<List<Map<String, dynamic>>?> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('https://9ac2-103-81-116-198.ngrok-free.app/api/education'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['education'];
      return results.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Server is down');
    }
  }
}
