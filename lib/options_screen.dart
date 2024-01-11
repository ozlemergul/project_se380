
import 'package:flutter/material.dart';
import 'employee_operations.dart';
import 'work_plan.dart';

import 'add_work_plan.dart';
import 'check_in_out.dart';
import 'employee_data_screen.dart';
import 'info_screen.dart';
import 'leave_days.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  _OptionsScreenState createState() => _OptionsScreenState();

  static void setCounter(){
    _OptionsScreenState.counter = 1;
  }

  static int getCounter(){
    return _OptionsScreenState.counter;
  }
}

class _OptionsScreenState extends State<OptionsScreen> {

  static int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 85),
                backgroundColor: Colors.teal[100],
              ),
              child: const Text(
                'Employee Operations',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmployeeOperationsScreen()));
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 85),
                backgroundColor: Colors.teal[100],
              ),
              child: const Text(
                'Check-in /out',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Check_In_Out_Screen()));
              },
            ),

            SizedBox(height: 10),


            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 85),
                backgroundColor: Colors.teal[100],
              ),
              child: const Text(
                'Employee Data',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmployeeDataScreen()));
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 85),
                backgroundColor: Colors.teal[100],
              ),
              child: const Text(
                'Leave Days',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LeaveDaysScreen()));
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 85),
                backgroundColor: Colors.teal[100],
              ),
              child: const Text(
                'Work Plan',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if(counter == 0){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddWorkPlanScreen()));
                }
                else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WorkPlanScreen()));
                }
              },
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