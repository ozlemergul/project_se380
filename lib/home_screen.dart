import 'package:flutter/material.dart';
import 'options_screen.dart';
import 'profile_screen.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: Colors.teal[400],

        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SizedBox(width: 8.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.0,),
                Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,

                    iconSize: 45.0,
                    color: Colors.white,
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OptionsScreen()));
                    },
                  ),
                ),
              ],

            ),



          ],
        ),



        actions: <Widget>[

          Container(
            width: 80.0,
            height: 90.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),

            padding: EdgeInsets.all(2.0),
            child: Center(
              child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 50.0,
                  color: Colors.white,

                  icon: Icon(Icons.person),

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()));
                  }
              ),
            ),

          ),
        ],
      ),

      body: const Center(

        child: Icon(
          Icons.apps,
          color: Colors.black,
          size: 200.0,
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
