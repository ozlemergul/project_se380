

import 'package:flutter/material.dart';
import 'employee_operations.dart';
import 'options_screen.dart';

import 'info_screen.dart';

class LeaveDaysScreen extends StatefulWidget {
  const LeaveDaysScreen({super.key});

  @override
  _LeaveDaysScreenState createState() => _LeaveDaysScreenState();
}


class _LeaveDaysScreenState extends State<LeaveDaysScreen> {

  TextEditingController _leaveDaysController = TextEditingController();

  static String leaveDays = "";

  static List<int> leaveDaysList = [];

  late List<String> choices;
  late String selectedChoice;
  late int index;

  @override
  void dispose() {
    _leaveDaysController.dispose();
    super.dispose();
  }

  // to fetch employee list when the widget initializes
  void initState() {
    super.initState();
    choices = EmployeeOperationsScreen.getEmployeeList();
    List<String> employeeList = EmployeeOperationsScreen.getEmployeeList();
    if(leaveDaysList != null && leaveDaysList.isEmpty){
      leaveDaysList = List.filled(EmployeeOperationsScreen.getEmployeeList().length, 0);}
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
        title: Text('Leave Days'),
        backgroundColor: Colors.teal,
      ),

      body: Center(
        child: Column(
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
                controller: _leaveDaysController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Leave Days"
                ),
              ),
            ),

            const SizedBox(height:20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal[50],
                minimumSize: Size(185,50),
              ),
              onPressed: () {

                setState(() {
                  leaveDays = _leaveDaysController.text;
                  index = choices.indexOf(selectedChoice);
                });


                if (leaveDays == null || leaveDays=="") {
                  print('Please enter leave days');

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
                              'Enter Leave Days!',
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
                  print(leaveDays);

                  setState(() {
                    leaveDaysList[index] = leaveDaysList.elementAt(index)+int.parse(leaveDays);
                    print(leaveDaysList);

                  });


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
                              'Leave Days Added!',
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

                  Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveDaysScreen()));

                }
              },

              child: const Text("Add Leave Days",
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
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionsScreen()));
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

                  icon: Icon(Icons.question_mark),

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InfoScreen()));
                  }
              ),
            ),
          ],
        ),


      ),

    );
  }
}