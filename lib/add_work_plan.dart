import 'dart:io';

import 'package:flutter/material.dart';
import 'options_screen.dart';
import 'work_plan.dart';

class AddWorkPlanScreen extends StatefulWidget {
  const AddWorkPlanScreen({super.key});

  @override
  _AddWorkPlanScreenState createState() => _AddWorkPlanScreenState();
}


class _AddWorkPlanScreenState extends State<AddWorkPlanScreen> {

  TextEditingController _leaveDaysController = TextEditingController();
  TextEditingController _workingDaysController = TextEditingController();

  static String maxLeaveDays = "";
  static String workingDays = "";
  static int intWorkingDays = int.parse(workingDays);

  @override
  void dispose() {
    _leaveDaysController.dispose();
    _workingDaysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Work Plan'),
        backgroundColor: Colors.teal,
      ),

      body: Column(
        children: [
          const SizedBox(height:30),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _leaveDaysController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Maximum Leave Days"
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _workingDaysController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Working Days Amount"
              ),
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[50],
              minimumSize: Size(185,50),
            ),
            onPressed: () {

              setState(() {
                maxLeaveDays = _leaveDaysController.text;
                workingDays = _workingDaysController.text;
                intWorkingDays = int.parse(workingDays);
              });



              if((maxLeaveDays == null || maxLeaveDays=="") && (workingDays == null || workingDays=="" )){

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
                            'Enter Maximum Leave Days!\n'
                                'Enter Working Days Amount!',
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


              else if (maxLeaveDays == null || maxLeaveDays=="") {
                print('Please enter maximum leave days');

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
                            'Enter Maximum Leave Days!',
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

              else if (workingDays == null || workingDays=="") {
                print('Please enter working days amount');

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
                            'Enter Working Days amount!',
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

              if(!(0<intWorkingDays && intWorkingDays<8)){

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
                            'Working Days amount should between 1-7',
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
                print(MainAxisSize.max);
                print(workingDays);

                WorkPlanScreen.maxLeaveDays = maxLeaveDays;
                WorkPlanScreen.workingDays = workingDays;
                WorkPlanScreen.changeValues();
                OptionsScreen.setCounter();

                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context) => WorkPlanScreen()));

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
              if(OptionsScreen.getCounter() != 0){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkPlanScreen()));
              }
              else{
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionsScreen()));
              }
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