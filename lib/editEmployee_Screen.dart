


import 'package:flutter/material.dart';
import 'employee_operations.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({super.key});

  @override
  _EditEmployeeScreenState createState() => _EditEmployeeScreenState();
}


class _EditEmployeeScreenState extends State<EditEmployeeScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _hourlySalaryController = TextEditingController();

  static String name = "";
  static String cardNumber = "";
  static String hourlySalary = "";

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _hourlySalaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Add Employee'),
        backgroundColor: Colors.teal,
      ),

      body: Column(

        children: [
          SizedBox(height:30),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: EmployeeOperationsScreen.getName(),
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: EmployeeOperationsScreen.getCardNumber(),
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _hourlySalaryController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: EmployeeOperationsScreen.getHourlySalary(),
              ),
            ),
          ),

          const SizedBox(height:30),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[50],
              minimumSize: Size(185,50),
            ),
            onPressed: () {

              setState(() {
                name = _nameController.text;
                cardNumber = _cardNumberController.text;
                hourlySalary = _hourlySalaryController.text;

              });
              print("CARD number: " + cardNumber);

              if(name != ""){
                EmployeeOperationsScreen.name = name;
                EmployeeOperationsScreen.changeName();
              }
              if(cardNumber != ""){
                EmployeeOperationsScreen.cardNumber = cardNumber;
                EmployeeOperationsScreen.changeCardNumber();
              }
              if(hourlySalary != ""){
                EmployeeOperationsScreen.hourlySalary = hourlySalary;
                EmployeeOperationsScreen.changeHourlySalary();
              }


              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeOperationsScreen()));
            },
            child: const Text("Save Changes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),

          const SizedBox(height:10),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[50],
              minimumSize: Size(185,50),
            ),
            onPressed: () {
              EmployeeOperationsScreen.removeFromList();

              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeOperationsScreen()));
            },
            child: const Text("Delete Employee",
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