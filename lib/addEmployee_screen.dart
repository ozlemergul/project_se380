


import 'package:flutter/material.dart';
import 'employee_operations.dart';
class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();

  void onNameSelected(String text) {}
}


class _AddEmployeeScreenState extends State<AddEmployeeScreen> {

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
      ),

      body: Column(

        children: [
          const SizedBox(height:30),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name - Surname"
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Card Number"
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _hourlySalaryController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Hourly Salary"
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

              if((name == null || name=="") && (cardNumber == null || cardNumber=="" ) && (hourlySalary == null || hourlySalary=="")){

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
                            'Enter Name!\n'
                                'Enter Card Number!\n'
                                'Enter Hourly Salary!',
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

              else if((name == null || name=="") && (hourlySalary == null || hourlySalary=="")){

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
                            'Enter Name!\n'
                                'Enter Hourly Salary!',
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

              else if((cardNumber == null || cardNumber=="") && (hourlySalary == null || hourlySalary=="")){

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
                            'Enter Card Number!\n'
                                'Enter Hourly Salary!',
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

              else if((name == null || name=="") && (cardNumber == null || cardNumber=="")){

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
                            'Enter Name!\n'
                                'Enter Card Number!',
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


              else if (name == null || name=="") {
                print('Please enter a name');

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
                            'Enter Name!',
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

              else if (cardNumber == null || cardNumber=="") {
                print('Please enter a card Number');

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
                            'Enter Card Number!',
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

              else if (hourlySalary == null || hourlySalary=="") {
                print('Please enter a hourly salary');

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
                            'Enter Hourly Salary!',
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
                print(name);
                print(cardNumber);
                print(hourlySalary);

                EmployeeOperationsScreen.name = name;
                EmployeeOperationsScreen.name = name;
                EmployeeOperationsScreen.name = name;
                EmployeeOperationsScreen.addtoList(name, cardNumber, hourlySalary);

                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeOperationsScreen()));


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
                  MaterialPageRoute(builder: (context) => EmployeeOperationsScreen()));
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