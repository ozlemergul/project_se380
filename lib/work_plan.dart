

import 'package:flutter/material.dart';
import 'add_work_plan.dart';
import 'info_screen.dart';

class WorkPlanScreen extends StatefulWidget {
  const WorkPlanScreen({super.key});

  @override
  _WorkPlanScreenState createState() => _WorkPlanScreenState();

  static String maxLeaveDays = "";
  static String workingDays = "";

  static void changeValues(){
    _WorkPlanScreenState.maxLeaveDays = maxLeaveDays;
    _WorkPlanScreenState.workingDays = workingDays;
  }


}


class _WorkPlanScreenState extends State<WorkPlanScreen> {

  static String maxLeaveDays = "";
  static String workingDays = "";



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Work Plan'),
        backgroundColor: Colors.teal,
      ),

      body: Center(
        child: Column(

          children: [
            const SizedBox(height:20),
            Container(
              width: 300.0,
              height: 90.0,

              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Colors.white,
              ),

              child: Row(
                children: [
                  const Text('   Maximum Leave Days: ',
                      style: TextStyle( fontSize: 20)),
                  Text(maxLeaveDays,
                      style: const TextStyle( fontSize:  20))
                ],
              ),
            ),
            const SizedBox(height:10),
            Container(
              width: 300.0,
              height: 90.0,

              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Colors.white,
              ),

              child: Row(
                children: [

                  const Text('   Working Days Amount: ',
                      style: TextStyle( fontSize: 20)),
                  Text(workingDays,
                      style: const TextStyle( fontSize:  20))
                ],
              ),
            ),

            const SizedBox(height:20),

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(185, 50),
                backgroundColor: Colors.teal[100],
              ),
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddWorkPlanScreen()));
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