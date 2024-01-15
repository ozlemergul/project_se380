import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'info_screen.dart';

class EmployeeDataScreen extends StatefulWidget {
  const EmployeeDataScreen({Key? key}) : super(key: key);

  @override
  _EmployeeDataScreenState createState() => _EmployeeDataScreenState();
}

class _EmployeeDataScreenState extends State<EmployeeDataScreen> {
  TextEditingController _employeeDataController = TextEditingController();

  late List<String> choices;
  late List<String> displayNames; // Add a list for display names
  late String selectedChoice;
  late int index;

  late String nameSurname='';
  late String cardNumber='';
  late String hourlySalary='';
  late String leaveDays='';
  late String totalSalary='';

  @override
  void initState() {
    super.initState();
    choices = ['0YcvzOXUsPU83nnCEJmm', '02xGCAGAEgGTXWNPPsKV'];
    displayNames = ['Employee 1', 'Employee 2']; // Specify the display names here
    selectedChoice = choices[0];
    fetchData(); // Fetch initial data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Data'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                const Text(
                  'Employee: ',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: selectedChoice,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedChoice = newValue;
                            fetchData();
                          });
                        }
                      },
                      items: displayNames.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: choices[displayNames.indexOf(value)], // Get the corresponding document ID
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Display other UI elements with fetched data
            Text('Name-Surname: $nameSurname', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Card Number: $cardNumber', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Hourly Salary: $hourlySalary', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Leave Days: $leaveDays', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Total Salary: $totalSalary', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 60.0,
              height: 90.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 50.0,
                color: Colors.white,
                icon: const Icon(Icons.question_mark),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fetch data from Firestore based on the selectedChoice
  void fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Registers')
          .doc(selectedChoice)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          nameSurname = documentSnapshot['nameSurname'];
          cardNumber = documentSnapshot['cardNumber'];
          hourlySalary = documentSnapshot['hourlySalary'];
          leaveDays = documentSnapshot['leaveDays'];
          totalSalary = documentSnapshot['totalSalary'];
        });
      } else {
        setState(() {
          nameSurname = 'N/A';
          cardNumber = 'N/A';
          hourlySalary = 'N/A';
          leaveDays = 'N/A';
          totalSalary = 'N/A';
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}