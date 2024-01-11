
import 'package:flutter/material.dart';

class EmployeeDataScreen extends StatefulWidget {
  const EmployeeDataScreen({super.key});

  @override
  _EmployeeDataScreenState createState() => _EmployeeDataScreenState();
}


class _EmployeeDataScreenState extends State<EmployeeDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Data'),
        backgroundColor: Colors.teal,
      ),
    );

  }

}



