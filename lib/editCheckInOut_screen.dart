import 'package:flutter/material.dart';
import 'check_in_out.dart';

class EditCheckInOut extends StatefulWidget {
  const EditCheckInOut({super.key});

  @override
  _EditCheckInOutState createState() => _EditCheckInOutState();
}

class _EditCheckInOutState extends State<EditCheckInOut> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _enterHourController = TextEditingController();
  TextEditingController _exitHourController = TextEditingController();

  static String date = "";
  static String enterHour = "";
  static String exitHour = "";

  // List of employees
  List<String> employeelist = [];
  String selectedEmployee = ''; // Default selected employee

  @override
  void dispose() {
    _dateController.dispose();
    _enterHourController.dispose();
    _exitHourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Check-In/Out'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          // Dropdown for employee selection
          DropdownButton<String>(
            value: selectedEmployee,
            onChanged: (String? newValue) {
              setState(() {
                selectedEmployee = newValue!;
              });
            },
            items: employeelist.map((String employee) {
              return DropdownMenuItem<String>(
                value: employee,
                child: Text(employee),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: Check_In_Out_Screen.getDate(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _enterHourController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: Check_In_Out_Screen.getEnterHour(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _exitHourController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: Check_In_Out_Screen.getExitHour(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[50],
              minimumSize: Size(185, 50),
            ),
            onPressed: () {
              setState(() {
                date = _dateController.text;
                enterHour = _enterHourController.text;
                exitHour = _exitHourController.text;
              });
              print("Enter Hour: " + enterHour);

              if (date != "") {
                Check_In_Out_Screen.date = date;
                Check_In_Out_Screen.changeDate();
              }
              if (enterHour != "") {
                Check_In_Out_Screen.enterHour = enterHour;
                Check_In_Out_Screen.changeEnterHour();
              }
              if (exitHour != "") {
                Check_In_Out_Screen.exitHour = exitHour;
                Check_In_Out_Screen.changeExitHour();
              }

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Check_In_Out_Screen()),
              );
            },
            child: const Text(
              "Save Changes",
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
              minimumSize: Size(185, 50),
            ),
            onPressed: () {
              Check_In_Out_Screen.removeFromList();

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Check_In_Out_Screen()),
              );
            },
            child: const Text(
              "Delete Check-In/Out",
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
