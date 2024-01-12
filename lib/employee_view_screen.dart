
import 'package:flutter/material.dart';

import 'info_screen.dart';

class EmployeeViewScreen extends StatefulWidget {
  const EmployeeViewScreen({super.key});

  @override
  _EmployeeViewScreenState createState() => _EmployeeViewScreenState();
}

class _EmployeeViewScreenState extends State<EmployeeViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),

              const Text('Name-Surname: ',
                  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),

                  ),
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
                    /*Text('özlem ergül',
                        style: const TextStyle( fontSize:  20))*/
                  ],
                ),
              ),

              SizedBox(height: 10),

              const Text('Card Number: ',
                style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),

              ),
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
                    /*Text('1',
                        style: const TextStyle( fontSize:  20))*/
                  ],
                ),
              ),

              SizedBox(height: 10),

              const Text('Hourly Salary: ',
                style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),

              ),
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
                    /*Text('1',
                        style: const TextStyle( fontSize:  20))*/
                  ],
                ),
              ),


              SizedBox(height: 10),

              const Text('Leave Days: ',
                style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),

              ),
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
                    /*Text('5',
                        style: const TextStyle( fontSize:  20))*/
                  ],
                ),
              ),

              SizedBox(height: 10),

              const Text('Total Salary: ',
                style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),

              ),
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
                    /*Text('5',
                        style: const TextStyle( fontSize:  20))*/
                  ],
                ),
              ),

            ]
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