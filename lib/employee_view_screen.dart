import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class EmployeeViewScreen extends StatefulWidget {
  const EmployeeViewScreen({Key? key}) : super(key: key);

  @override
  _EmployeeViewScreenState createState() => _EmployeeViewScreenState();
}

class _EmployeeViewScreenState extends State<EmployeeViewScreen> {
  late Stream<DocumentSnapshot> userDataStream;

  @override
  void initState() {
    super.initState();

    userDataStream = FirebaseFirestore.instance
        .collection('Registers') // Replace 'yourCollectionPath' with the actual path to your collection
        .doc('0YcvzOXUsPU83nnCEJmm')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Data'),
        backgroundColor: Colors.teal,
        actions: [
          // Add the logout button here
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Perform logout actions here
              // For example, navigate to the login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen(title: '')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: userDataStream,
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            final Map<String, dynamic>? data = snapshot.data?.data() as Map<String, dynamic>?;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const SizedBox(height: 20),

                buildTextRow('Name-Surname: ', data?['nameSurname'] ?? ''),
                buildTextRow('Card Number: ', data?['cardNumber'] ?? ''),
                buildTextRow('Hourly Salary: ', data?['hourlySalary'] ?? ''),
                buildTextRow('Leave Days: ', data?['leaveDays'] ?? ''),
                buildTextRow('Total Salary: ', data?['totalSalary'] ?? ''),
              ],
            );
          },
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
                icon: const Icon(Icons.help_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InfoScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          width: 350.0,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey, width: 1.0),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Text(value),
            ],
          ),
        ),
      ],
    );
  }
}
