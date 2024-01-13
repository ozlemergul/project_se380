
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
    body: const SingleChildScrollView(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Our application is about an employee’s  salary calculation program. When you enter in our application, first of all, you register and choose if you are manager or an employee. '
                  'After you register, the main screen will come up. '
                  'From the left top you can open the Menu and go to the 5 main screens which are ‘Employee Operations’, ‘Check-In/Out’, ‘Print File Generation’, ‘Leave Days’ and ‘Work Plan’. '

        'In ‘Employee Operations’ if you are the manager that means you are the editor and can access to every page to edit.'
                  ' In this page, you click to ‘+’ button and a new page will come up. You will enter the information of employees and save it. '
                  'After saving it, you will be transferred to the employee page which has a list box of employees. '
                  'In every line there is written a name of employee and when you click on it, you can see all the information of theirs.'

        'In ‘Check-In/Out’ page, you will see the same frontend with ‘Employee Operations’ page with a huge list box and a ‘+’ button. '
                  'When you click to buton, you will enter the name and the enter/exit hours of employee. '
                  'After saving it, you can see the employee’s name on the list box in the main page of ‘Check-In/Out’ page.'

        'In ‘Employee Data’ page, the main idea is to see the selected employee’s information.'
                  ' You will select the entered employee’s name from the dropdown box and after selecting it, the information of theirs will be shown in the screen.'

        'In ‘Leave Days’, you will enter the name of the employee and their leave days, the program will calculate their net salary according to this and will be printed into the screen.'

        'In ‘Work Plan’, you can enter the maximum leave days and working days amount by each employee.'

            'In the home page, you can at the right top the page there is a figure. When you click to that figure, you can view your profile.'

        'If you are one of the employees, than when you open the application, you will only see your information.',
                style: TextStyle(fontSize: 20.0),
              ),
              //TODO: sayfayı düzenle
            ]
        ),
      ),
    ),
    );
  }
}