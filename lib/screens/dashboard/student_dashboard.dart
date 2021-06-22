import 'package:flutter/material.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<StudentDashboard> {
  final int _currAttendance = 75;
  final int _reqAttendance = 85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {
                print('pressed');
              })
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent, foregroundColor: Colors.black,
        shadowColor: Colors.transparent, // backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 80,
              child: DrawerHeader(
                child: Text(
                  'Study Buddy',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 35),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF635BEB),
                ),
              ),
            ),
            ListTile(
              title: Text(
                ' Dashboard',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {print('pressed');},
            ),
            ListTile(
              title: Text(
                ' Attendance',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {print('pressed');},
            ),
            ListTile(
              title: Text(
                ' Notes',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {print('pressed');},
            ),ListTile(
              title: Text(
                ' Fees',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {print('pressed');},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Text(
                'Study Buddy',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 42,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              // color: Color(0xFFEDEDED),
              // child: SizedBox(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      splashColor: Colors.black,
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        //keyboardType: TextInputType.text,
                        //textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.green)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "What do you want to learn today?"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.mic_none,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                        //backgroundColor: Colors.deepPurple,
                        //child: Text('RD'),
                      ),
                    ),
                  ],
                ),
              ),
            // ),
            Card(
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Color(0xFFEDEDED),
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Container(
                width: 324,
                height: 150,
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Text(
                          'Attendance',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Current Attendance - $_currAttendance%',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Required Attendance - $_reqAttendance%',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    TextButton(
                      child: Container(
                        child: Text(
                          'See More . . .',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                      ),
                      onPressed: () {
                        print('pressed');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Color(0xFFEDEDED),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Container(
                width: 324,
                height: 165,
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'NOTES',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Prof. Albert uploaded Java notes',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Mr. Nicholas uploaded Python notes',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 5),
                      child: TextButton(
                          child: Text(
                            'See More . . .',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          onPressed: () {
                            print('pressed');
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Color(0xFFEDEDED),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Container(
                width: 324,
                height: 80,
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Fees',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'No pending fees',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
