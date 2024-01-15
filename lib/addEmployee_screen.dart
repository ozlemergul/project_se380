import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'employee_operations.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _hourlySalaryController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name - Surname",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Card Number",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _hourlySalaryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Hourly Salary",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email Address",
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[50],
              minimumSize: const Size(185, 50),
            ),
            onPressed: () async {
              String name = _nameController.text;
              String cardNumber = _cardNumberController.text;
              String hourlySalary = _hourlySalaryController.text;
              String email = _emailController.text;

              // Validate input fields
              if (name.isEmpty || cardNumber.isEmpty || hourlySalary.isEmpty || email.isEmpty) {
                // Show error message if any field is empty
                // (You can display the error in a more user-friendly way)
                print('Please fill in all fields.');
                return;
              }

              // Save data to Firestore
              CollectionReference employees = FirebaseFirestore.instance.collection('Registers');

              await employees.add({
                'name': name,
                'cardNumber': cardNumber,
                'hourlySalary': hourlySalary,
                'email': email,
              });

              // Clear text fields after saving data
              _nameController.clear();
              _cardNumberController.clear();
              _hourlySalaryController.clear();
              _emailController.clear();

              EmployeeOperationsScreen.name = name;
              EmployeeOperationsScreen.cardNumber = cardNumber;
              EmployeeOperationsScreen.hourlySalary = hourlySalary;
              EmployeeOperationsScreen.addtoList(name, cardNumber, hourlySalary,email);

              // Navigate back or to another screen
              Navigator.pop(context);
              // Optionally, you can navigate to EmployeeOperationsScreen
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => EmployeeOperationsScreen(),
              ));
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[50],
              minimumSize: const Size(185, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeOperationsScreen(),
                ),
              );
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
