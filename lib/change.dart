import 'package:flutter/material.dart';
import 'package:miniproject12/homepage.dart';
import 'sizeConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'student.dart';
import 'login.dart';

class Change extends StatefulWidget {
  static var id = 'Change';

  const Change({Key? key}) : super(key: key);

  @override
  _ChangeState createState() => _ChangeState();
}

FirebaseFirestore firestore = FirebaseFirestore.instance;

class _ChangeState extends State<Change> {
  static var color1 = Colors.grey;
  static var color2 = Colors.grey;
  var monday;
  static var str = "Request";
  var name = Login.name;
  var password = Login.ids;
  var status = false;
  var tuesday;
  var wednesday;
  var thursday;
  var friday;
  var saturday;
  var hosteldetail;
  static int counter = 0;

  @override
  Widget build(BuildContext context) {
    DateTime currentPhoneDate = DateTime.now(); //DateTime

    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp


    DateTime myDateTime = myTimeStamp.toDate();
    CollectionReference users =
        FirebaseFirestore.instance.collection('Student');
    CollectionReference hostelusers =
        FirebaseFirestore.instance.collection('Hostel');

    final Stream<QuerySnapshot> user =
        FirebaseFirestore.instance.collection('Student').snapshots();
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor:  Color(0XFF023455),
          actions: [
            // BackButton(onPressed: (){
            //   Navigator.pushNamed(context, HomePage.id);
            // },),
            SizedBox(
              height: 80,
              width: SizeConfig.safeBlockHorizontal * 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Welcome ${Login.name}',
                    style: const TextStyle(
                        fontSize: 17.50,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                child: const Text('HomePage'))
          ],
        ),
        body: Container(
          // decoration: BoxDecoration(
          //         //     image: DecorationImage(
          //         //         image: AssetImage('assets/boys.jpg'),
          //         //       fit: BoxFit.fill
          //         //     ),
          //         //
          //         // ),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0XFF023455),
              Color(0XFF045D99),

              // Colors.green,
              // Colors.greenAccent
            ],
          )),
          height: SizeConfig.safeBlockVertical * 100,
          width: SizeConfig.safeBlockHorizontal * 100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Mess Details',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 100,
                  height: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      messwidget(
                        day: 'Monday',
                        food1: 'Chole Rice',
                        food2: 'Sandwich',
                        food3: 'Aloo Soyabean',
                        onPressed1: () {
                          setState(() {
                            monday = 'Chole Rice';
                          });
                        },
                        onPressed2: () {
                          setState(() {
                            monday = 'Sandwich';
                          });
                        },
                        onPressed3: () {
                          setState(() {
                            monday = 'Aloo Soyabean';
                          });
                        },
                      ),
                      messwidget(
                        day: 'Tuesday',
                        food1: 'Rajma Rice',
                        food2: 'Aloo Parantha',
                        food3: 'Mix Veg Rice',
                        onPressed1: () {
                          setState(() {
                            tuesday = 'Rajma Rice';
                          });
                        },
                        onPressed2: () {
                          setState(() {
                            tuesday = 'Aloo Parantha';
                          });
                        },
                        onPressed3: () {
                          setState(() {
                            tuesday = 'Mix Veg Rice';
                          });
                        },
                      ),
                      messwidget(
                        day: 'Wednesday',
                        food1: 'Paneer Rice',
                        food2: 'Paneer Parantha',
                        food3: 'Matar Paneer',
                        onPressed1: () {
                          setState(() {
                            wednesday = 'Paneer Rice';
                          });
                        },
                        onPressed2: () {
                          setState(() {
                            wednesday = ' Paneer Parantha';
                          });
                        },
                        onPressed3: () {
                          setState(() {
                            wednesday = 'Matar Paneer';
                          });
                        },
                      ),
                      messwidget(
                        day: 'Thursday',
                        food1: 'Chole Puri',
                        food2: 'Gobi Parantha',
                        food3: 'Laal Masoor Dal Rice',
                        onPressed1: () {
                          thursday = 'Chole Puri';
                        },
                        onPressed2: () {
                          thursday = 'Gobi Parantha';
                        },
                        onPressed3: () {
                          thursday = 'Laal Masoor Dal Rice';
                        },
                      ),
                      messwidget(
                        day: 'Friday',
                        food1: 'Arhar Dal Rice',
                        food2: 'Veg Pulao',
                        food3: 'Chapati Green Veg',
                        onPressed1: () {
                          setState(() {
                            friday = 'Arhar Dal Rice';
                          });
                        },
                        onPressed2: () {
                          setState(() {
                            friday = 'Veg Pulao';
                          });
                        },
                        onPressed3: () {
                          setState(() {
                            friday = 'Chapati Green Veg';
                          });
                        },
                      ),
                      messwidget(
                        day: 'Saturday',
                        food1: ' Aloo Puri ',
                        food2: 'Urad Dal Rice',
                        food3: 'Curry Chawal',
                        onPressed1: () {
                          saturday = ' Aloo Puri ';
                        },
                        onPressed2: () {
                          saturday = 'Urad Dal Rice';
                        },
                        onPressed3: () {
                          saturday = 'Curry Chawal';
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color1 = Colors.blue;
                      counter = counter + 1;
                      str = "Requested";
                    });
                    // TimeStamp to DateTime

                    users
                        .doc('${Login.name}')
                        .set(
                          {
                            "Monday": monday,
                            "Tuesday": tuesday,
                            "Wednesday": wednesday,
                            "Thursday": thursday,
                            "Friday": friday,
                            "Saturday": saturday,
                            "name": name,
                            "id": password,
                            "validated": false,
                            "timestamp": myDateTime,
                          },
                          SetOptions(merge: true),
                        )
                        .then((value) => print("requested"))
                        .catchError(
                            (error) => print("Failed to request data: $error"));
                    // }
                    //                 users
                    //                     .add({
                    //                       "Monday": monday,
                    //                       "Tuesday": tuesday,
                    //                       "Wednesday": wednesday,
                    //                       "Thursday": thursday,
                    //                       "Friday": friday,
                    //                       "Saturday": saturday,
                    //                       "name": name,
                    //                       "id": password,
                    //                       "timestamp": myDateTime,
                    //                     })
                    //                     .then((value) => print('user added'))
                    //                     .catchError((error) => print("failed"));
                    Navigator.pushNamed(context, Change.id);
                    // hostelusers.doc('${Login.name}')
                    //     .set({
                    //   "hostel": null,
                    //   "name": null,
                    //   "id": null,
                    //   "timestamp": myDateTime,
                    // },
                    //   SetOptions(merge: true),
                    // )
                    //     .then(
                    //         (value) => print("")
                    // )
                    //     .catchError((error) => print("Failed to request data: $error"));
                    // hostelusers
                    //     .add({
                    //       "hostel": null,
                    //       "name": null,
                    //       "id": null,
                    //       "timestamp": myDateTime,
                    //     })
                    //     .then((value) => print('user added'))
                    //     .catchError((error) => print("failed"));
                  },
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: color1,
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      height: 40,
                      width: 150,
                      child: Center(
                        child: Text(
                          str,
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Hostel Details',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 100,
                  height: 720,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          hostelwidget(
                            hostel: 'Sai Hostel',
                            room1: 1,
                            room2: 2,
                            room3: 3,
                            room4: 4,
                            onPressed1: () {
                              hosteldetail =
                                  'Sai Hostel - Non AC rooms 3 seater ';
                            },
                            onPressed2: () {
                              hosteldetail = 'Sai Hostel -  AC rooms 3 seater ';
                            },
                            onPressed3: () {
                              hosteldetail =
                                  'Sai Hostel - Non AC rooms 2 seater ';
                            },
                            onPressed4: () {
                              hosteldetail = 'Sai Hostel - AC rooms 2 seater ';
                            },
                          ),
                          hostelwidget(
                            hostel: 'SC Bose Hostel',
                            room1: 1,
                            room2: 2,
                            room3: 3,
                            room4: 4,
                            onPressed1: () {
                              hosteldetail =
                                  'SC Bose Hostel - Non AC rooms 3 seater ';
                            },
                            onPressed2: () {
                              hosteldetail =
                                  'SC Bose Hostel -  AC rooms 3 seater ';
                            },
                            onPressed3: () {
                              hosteldetail =
                                  'SC Bose Hostel- Non AC rooms 2 seater ';
                            },
                            onPressed4: () {
                              hosteldetail =
                                  'SC Bose Hostel - AC rooms 2 seater ';
                            },
                          ),
                          hostelwidget(
                            hostel: 'APJ Abdul Kalam',
                            room1: 1,
                            room2: 2,
                            room3: 3,
                            room4: 4,
                            onPressed1: () {
                              hosteldetail =
                                  'APJ Abdul Kalam - Non AC rooms 3 seater ';
                            },
                            onPressed2: () {
                              hosteldetail =
                                  'APJ Abdul Kalam -  AC rooms 3 seater ';
                            },
                            onPressed3: () {
                              hosteldetail =
                                  'APJ Abdul Kalam- Non AC rooms 2 seater ';
                            },
                            onPressed4: () {
                              hosteldetail =
                                  'APJ Abdul Kalam- AC rooms 2 seater ';
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          hostelwidget(
                            hostel: 'Chandra Shekhar',
                            room1: 1,
                            room2: 2,
                            room3: 3,
                            room4: 4,
                            onPressed1: () {
                              hosteldetail =
                                  'Chandra Shekhar - Non AC rooms 3 seater ';
                            },
                            onPressed2: () {
                              hosteldetail =
                                  'Chandra Shekhar -  AC rooms 3 seater ';
                            },
                            onPressed3: () {
                              hosteldetail =
                                  'Chandra Shekhar- Non AC rooms 2 seater ';
                            },
                            onPressed4: () {
                              hosteldetail =
                                  'Chandra Shekhar- AC rooms 2 seater ';
                            },
                          ),
                          hostelwidget(
                            hostel: 'Marina',
                            room1: 1,
                            room2: 2,
                            room3: 3,
                            room4: 4,
                            onPressed1: () {
                              hosteldetail = 'Marina - Non AC rooms 3 seater ';
                            },
                            onPressed2: () {
                              hosteldetail = 'Marina -  AC rooms 3 seater ';
                            },
                            onPressed3: () {
                              hosteldetail = 'Marina- Non AC rooms 2 seater ';
                            },
                            onPressed4: () {
                              hosteldetail = 'Marina- AC rooms 2 seater ';
                            },
                          ),
                          hostelwidget(
                            hostel: 'Sarojini',
                            room1: 1,
                            room2: 2,
                            room3: 3,
                            room4: 4,
                            onPressed1: () {
                              hosteldetail =
                                  'Sarojini - Non AC rooms 3 seater ';
                            },
                            onPressed2: () {
                              hosteldetail = 'Sarojini -  AC rooms 3 seater ';
                            },
                            onPressed3: () {
                              hosteldetail = 'Sarojini- Non AC rooms 2 seater ';
                            },
                            onPressed4: () {
                              hosteldetail = 'Sarojini- AC rooms 2 seater ';
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          hostelusers
                              .doc('${Login.name}')
                              .set(
                                {
                                  "hostel": hosteldetail,
                                  "name": name,
                                  "id": password,
                                  "timestamp": myDateTime,
                                  "validated": false,
                                },
                                SetOptions(merge: true),
                              )
                              .then((value) => print(""))
                              .catchError((error) =>
                                  print("Failed to request data: $error"));
                          // hostelusers
                          //     .add({
                          //       "hostel": hosteldetail,
                          //       "name": name,
                          //       "id": password,
                          //       "timestamp": myDateTime,
                          //     })
                          //     .then((value) => print('user added'))
                          //     .catchError((error) => print("failed"));
                          Navigator.pushNamed(context, HomePage.id);
                          setState(() {
                            color1 = Colors.grey;

                            str = "Request";
                          });
                        },
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: color2,
                          elevation: 5.0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            height: 40,
                            width: 150,
                            child: const Center(
                              child: Text(
                                'Request',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class hostelwidget extends StatelessWidget {
  final String hostel;
  final int room1;
  final int room2;
  final int room3;
  final int room4;
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;
  final VoidCallback? onPressed3;
  final VoidCallback? onPressed4;

  const hostelwidget(
      {required this.onPressed1,
      required this.onPressed2,
      required this.onPressed3,
      required this.onPressed4,
      required this.hostel,
      required this.room1,
      required this.room2,
      required this.room3,
      required this.room4});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color:   Color(0XFF023455),
        elevation: 7.5,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              hostel,
              style: const TextStyle(
                  fontSize: 21.0,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFF045D99),),
              ),
              child: Text(
                'Non Ac Rooms - 3 seater $room1 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              onPressed: onPressed1,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFF045D99),),
              ),
              child: Text(
                'Ac Rooms - 3 seater $room2 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              onPressed: onPressed2,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFF045D99),),
              ),
              child: Text(
                'Non Ac Rooms - 2 seater $room3 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              onPressed: onPressed3,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFF045D99),),
              ),
              child: Text(
                'Ac Rooms - 2 seater $room4 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              onPressed: onPressed4,
            ),
          ],
        ),
      ),
    );
  }
}

class messwidget extends StatelessWidget {
  final String food1;
  final String food2;
  final String food3;
  final String day;
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;
  final VoidCallback? onPressed3;

  const messwidget(
      {required this.onPressed1,
      required this.onPressed2,
      required this.onPressed3,
      required this.day,
      required this.food1,
      required this.food2,
      required this.food3});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Color(0XFF023455),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 7.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            day,
            style: const TextStyle(
                fontSize: 22.0,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0XFF045D99),),
            ),
            child: Text(
              food1,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            onPressed: onPressed1,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0XFF045D99),),
            ),
            child: Text(
              food2,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            onPressed: onPressed2,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0XFF045D99),),
            ),
            child: Text(
              food3,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            onPressed: onPressed3,
          ),
        ],
      ),
    );
  }
}
