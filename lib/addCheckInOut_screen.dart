

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'check_in_out.dart';
import 'employee_operations.dart';


class AddCheckInOut extends StatefulWidget {
  const AddCheckInOut({super.key});

  @override
  _AddCheckInOutState createState() => _AddCheckInOutState();
}


class _AddCheckInOutState extends State<AddCheckInOut> {

  TextEditingController _enterHourController = TextEditingController();
  TextEditingController _exitHourController = TextEditingController();


  static String enterHour = "";
  static String exitHour = "";

  static List<String> enterHourList = [];
  static List<String> exitHourList = [];


  late List<String> choices;
  late String selectedChoice;
  late int index;

  @override
  void dispose() {
    _enterHourController.dispose();
    _exitHourController.dispose();


    super.dispose();
  }

  void initState() {
    super.initState();
    choices = EmployeeOperationsScreen.getEmployeeList();
    List<String> employeeList = EmployeeOperationsScreen.getEmployeeList();
    if(enterHourList != null && enterHourList.isEmpty){
      enterHourList = List.filled(EmployeeOperationsScreen.getEmployeeList().length, "");}
    if(exitHourList != null && exitHourList.isEmpty){
      exitHourList = List.filled(EmployeeOperationsScreen.getEmployeeList().length, "");}
    if (employeeList.isNotEmpty) {
      selectedChoice = employeeList.first; // Set the initial value to the first item
    } else {
      selectedChoice = ''; // Set a default value if the list is empty
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Add Check-In/Out'),
        backgroundColor: Colors.teal,
      ),

      body: Column(

        children: <Widget>[
          const SizedBox(height:20),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              const Text(
                'Employee: ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10.0),
              Container(
                width: 250.0,
                height: 50.0,

                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: selectedChoice,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedChoice = newValue;
                        });
                      }
                    },
                    items: choices.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                ),
              )
            ],
          ),

          const SizedBox(height:20),





          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _enterHourController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Hour"
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _exitHourController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Exit Hour"
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
                enterHour = _enterHourController.text;
                exitHour = _exitHourController.text;

                index = choices.indexOf(selectedChoice);
              });


              if((enterHour == null || enterHour=="") && (exitHour == null || exitHour=="")){

                OverlayEntry overlayEntry = OverlayEntry(
                  builder: (context) => Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: Colors.teal,
                        child: const Center(
                          child: Text(
                            'Enter an Enter Hour!\n'
                                'Enter an Exit Hour!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

                Overlay.of(context)?.insert(overlayEntry);

                // Delay to remove the overlay after 2 seconds
                Future.delayed(Duration(seconds: 2), () {
                  overlayEntry.remove();
                });
              }

              else if (enterHour == null || enterHour=="") {
                print('Please enter a date');

                OverlayEntry overlayEntry = OverlayEntry(
                  builder: (context) => Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: Colors.teal,
                        child: const Center(
                          child: Text(
                            'Enter an Enter Hour!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

                Overlay.of(context)?.insert(overlayEntry);

                // Delay to remove the overlay after 2 seconds
                Future.delayed(Duration(seconds: 2), () {
                  overlayEntry.remove();
                });
              }


              else if (exitHour == null || exitHour =="") {
                print('Please enter an exit hour');

                OverlayEntry overlayEntry = OverlayEntry(
                  builder: (context) => Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: Colors.teal,
                        child: const Center(
                          child: Text(
                            'Enter an Exit Hour!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

                Overlay.of(context)?.insert(overlayEntry);

                // Delay to remove the overlay after 2 seconds
                Future.delayed(Duration(seconds: 2), () {
                  overlayEntry.remove();
                });
              }

              else{

                print(enterHour);
                print(exitHour);

                enterHourList[index] = enterHourList.elementAt(index);
                exitHourList[index] = exitHourList.elementAt(index);

                OverlayEntry overlayEntry = OverlayEntry(
                  builder: (context) => Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: Colors.teal,
                        child: const Center(
                          child: Text(
                            'Enter Hour and Exit Hour Added!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

                Overlay.of(context)?.insert(overlayEntry);

                // Delay to remove the overlay after 2 seconds
                Future.delayed(Duration(seconds: 2), () {
                  overlayEntry.remove();
                });


                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context) => Check_In_Out_Screen()));


              }
            },

            child: const Text("Save",
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
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Check_In_Out_Screen()));
            },
            child: const Text("Cancel",
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

