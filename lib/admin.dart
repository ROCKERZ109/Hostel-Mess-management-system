import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'sizeConfig.dart';
import 'homepage.dart';
import 'login.dart';

class Admin extends StatefulWidget {
  static var id = 'Admin';

  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

var color1 = Colors.grey;
var color2 = Colors.grey;
List<String> week = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];
int querlen = 0;
int hostellen = 0;
int messlen = 0;
var idf = '';

Future<int> getQueryLength() async {
  querlen = await FirebaseFirestore.instance
      .collection('Query')
      .get()
      .then((value) => value.size);
  return querlen;
}

Future<int> getHostelLength() async {
  hostellen = await FirebaseFirestore.instance
      .collection('Hostel')
      .get()
      .then((value) => value.size);
  print(hostellen);
  return hostellen;
}

Future<int> getMessLength() async {
  messlen = await FirebaseFirestore.instance
      .collection('Student')
      .get()
      .then((value) => value.size);
  print(messlen);
  return messlen;
}

class _AdminState extends State<Admin> {
  @override
  void initState() {
    getHostelLength();
    getMessLength();
    getQueryLength();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Student');
    final Stream<QuerySnapshot> user =
        FirebaseFirestore.instance.collection('Student').snapshots();
    CollectionReference hostelusers =
        FirebaseFirestore.instance.collection('Hostel');
    final Stream<QuerySnapshot> hosteluser =
        FirebaseFirestore.instance.collection('Hostel').snapshots();
    final Stream<QuerySnapshot> query =
        FirebaseFirestore.instance.collection('Query').snapshots();
    final Stream<QuerySnapshot> requestuser = FirebaseFirestore.instance
        .collection('Request')
        .orderBy("timestamp", descending: true)
        .limit(1)
        .snapshots();

    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Color(0XFF023455),
          actions: [
            // BackButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, HomePage.id);
            //   },
            // ),
            SizedBox(
              height: 80,
              width: SizeConfig.safeBlockHorizontal * 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Welcome Admin!',
                    style: TextStyle(
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
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Color(0xff701B52),
              // Color(0xffEE484A),
              Color(0XFF023455),
              Color(0XFF045D99),

            ],
          )),
          height: SizeConfig.safeBlockVertical * 100,
          width: SizeConfig.safeBlockHorizontal * 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Mess Requests',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // SizedBox(
                  //   width: 400,
                  //   height: 450,
                  //   child: Card(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15)),
                  //     color:Colors.teal,
                  //     elevation: 7.5,
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //         SizedBox(
                  //           height: 400,
                  //           width: 500,
                  //           child: StreamBuilder<QuerySnapshot>(
                  //               stream: user,
                  //               builder: (BuildContext context,
                  //                   AsyncSnapshot<QuerySnapshot> snaps) {
                  //                 if (snaps.hasError) {
                  //                   return const Text('error');
                  //                 }
                  //                 if (snaps.connectionState ==
                  //                     ConnectionState.waiting) {
                  //                   return const Center(
                  //                       child: CircularProgressIndicator());
                  //                 }
                  //                 final data = snaps.requireData;
                  //                  return
                  //                 // return Column(
                  //                 //   mainAxisAlignment:
                  //                 //       MainAxisAlignment.spaceEvenly,
                  //                 //   children: [
                  //                 //     Text(
                  //                 //       ' ${data.docs[0]['name']}'
                  //                 //           .toUpperCase(),
                  //                 //       style: const TextStyle(
                  //                 //           fontSize: 25,
                  //                 //           fontFamily: 'Nunito Sans',
                  //                 //           fontWeight: FontWeight.w900,
                  //                 //           color: Colors.white70),
                  //                 //     ),
                  //                 //     Text(
                  //                 //       ' ${data.docs[0]['id']}',
                  //                 //       style: const TextStyle(
                  //                 //           fontSize: 20,
                  //                 //           fontFamily: 'Nunito Sans',
                  //                 //           fontWeight: FontWeight.w900,
                  //                 //           color: Colors.white70),
                  //                 //     ),
                  //                 //     SizedBox(
                  //                 //       height: 335,
                  //                 //       width: 400,
                  //                 //       child: ListView.builder(
                  //                 //           itemCount: messlen,
                  //                 //           itemBuilder: (_, index) {
                  //                 //             return Center(
                  //                 //
                  //                 //               child: Text(
                  //                 //                 '${week[index]} - ${data.docs[index][week[index]]}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 17.50,
                  //                 //                     fontFamily: 'Nunito Sans',
                  //                 //                     fontWeight:
                  //                 //                         FontWeight.w900,
                  //                 //                     color: Colors.white70),
                  //                 //               ),
                  //                 //             );
                  //                 //           }),
                  //                 //     ),
                  //                 //   ],
                  //                 // );
                  //               }),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   width: SizeConfig.safeBlockHorizontal * 100,
                  //   height: 250,
                  //
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //               Container(
                  //                 height: 200,
                  //                 width: 200,
                  //                 child: StreamBuilder<QuerySnapshot>
                  //                   (
                  //                     stream: user,
                  //                     builder:(
                  //                         BuildContext context,
                  //                         AsyncSnapshot<QuerySnapshot>snaps
                  //                     )
                  //                     {
                  //                       if(snaps.hasError)
                  //                         {
                  //                           return Text('error');
                  //                         }
                  //                       if(snaps.connectionState==ConnectionState.waiting)
                  //                         {
                  //                           return Center(child: CircularProgressIndicator());
                  //                         }
                  //                       final data = snaps.requireData;
                  //                       return ListView.builder(
                  //                           itemCount:1,
                  //                           itemBuilder: (_,index){
                  //                         return Text('My name is ${data.docs[index]['name']}');
                  //                       });
                  //                     }
                  //                 ),
                  //               )
                  //
                  //            ],
                  //   ),
                  // ),
                  Container(
                      width: 400,
                      height: 550,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: user,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snaps) {
                            if (snaps.hasError) {
                              return const Text('error');
                            }
                            if (snaps.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final data = snaps.requireData;
                            return ListView.builder(
                                itemCount: messlen,
                                itemBuilder: (_, index) {
                                  return messlen == 0
                                      ? Card(
                                          child: Text(
                                            ' No requests',
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black),
                                          ),
                                        )
                                      : Container(
                                          width: 400,
                                          height: 455,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 400,
                                                height: 395,
                                                child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    color:  Color(0XFF023455),
                                                    elevation: 7.5,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          ' ${data.docs[index]['name']}'
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              fontSize: 25,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          ' ${data.docs[index]['id']}',
                                                          style: const TextStyle(
                                                              fontSize: 25,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${week[0]} - ${data.docs[index][week[0]]}',
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${week[1]} - ${data.docs[index][week[1]]}',
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${week[2]} - ${data.docs[index][week[2]]}',
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${week[3]} - ${data.docs[index][week[3]]}',
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${week[4]} - ${data.docs[index][week[4]]}',
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${week[5]} - ${data.docs[index][week[5]]}',
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    color2 = Colors.blue;
                                                  });
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('Student')
                                                      .doc(
                                                          '${data.docs[index]['name']}')
                                                      .update(
                                                          {'validated': 'true'})
                                                      .then((value) =>
                                                          print("User Updated"))
                                                      .catchError((error) => print(
                                                          "Failed to update user: $error"));
                                                },
                                                child: Material(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  elevation: 5.0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    height: 40,
                                                    width: 150,
                                                    child: const Center(
                                                      child: Text(
                                                        'Approve',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          ));
                                });
                          }))
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     setState(() {
                  //       color1 = Colors.blue;
                  //     });
                  //
                  //     await FirebaseFirestore.instance
                  //         .collection('Request')
                  //         .doc('change')
                  //         .update({'messvalidated': 'true'})
                  //         .then((value) => print("User Updated"))
                  //         .catchError((error) =>
                  //             print("Failed to update user: $error"));
                  //   },
                  //   child: Material(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15)),
                  //     color: color1,
                  //     elevation: 5.0,
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(50)),
                  //       height: 40,
                  //       width: 150,
                  //       child: const Center(
                  //         child: Text(
                  //           'Approve',
                  //           style: TextStyle(
                  //               fontSize: 15,
                  //               fontFamily: 'Nunito Sans',
                  //               fontWeight: FontWeight.w900,
                  //               color: Colors.white70),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Hostel Requests',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    height: 550,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: hosteluser,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snaps) {
                          if (snaps.hasError) {
                            return const Text('error');
                          }
                          if (snaps.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final data = snaps.requireData;
                          return ListView.builder(
                              itemCount: hostellen,
                              itemBuilder: (_, index) {
                                return hostellen == 0
                                    ? Card(
                                        child: Text(
                                          ' No requests',
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black),
                                        ),
                                      )
                                    : Container(
                                        width: 400,
                                        height: 350,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 400,
                                              height: 250,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  color: Color(0XFF023455),
                                                  elevation: 7.5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        ' ${data.docs[index]['name']}'
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 25,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        ' ${data.docs[index]['id']}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        ' ${data.docs[index]['hostel']}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                setState(() {});
                                                await FirebaseFirestore.instance
                                                    .collection('Hostel')
                                                    .doc(
                                                        '${data.docs[index]['name']}')
                                                    .update(
                                                        {'validated': 'true'})
                                                    .then((value) =>
                                                        print("User Updated"))
                                                    .catchError((error) => print(
                                                        "Failed to update user: $error"));
                                              },
                                              child: Material(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                elevation: 5.0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  height: 40,
                                                  width: 150,
                                                  child: Center(
                                                    child: const Text(
                                                      'Approve',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                              });
                        }),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Queries',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Container(
                    height: 600,
                    width: 380,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: query,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snaps) {
                          if (snaps.hasError) {
                            return const Text('error');
                          }
                          if (snaps.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final data = snaps.requireData;

                          return ListView.builder(
                              itemCount: querlen,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                    width: 400,
                                    height: 350,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        //  color: const Color(0xff701B52),
                                        color: Color(0XFF023455),
                                        elevation: 7.5,
                                        child: Column(children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 250,
                                            width: 500,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${data.docs[index]['name']}'
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '${data.docs[index]['email']}',
                                                  style: const TextStyle(
                                                      fontSize: 17.50,
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '${data.docs[index]['phone']}',
                                                  style: const TextStyle(
                                                      fontSize: 19.50,
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    '${data.docs[index]['query']}',
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ])));
                              });
                        }),
                  )
                ],
              ),
            ],
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
  final VoidCallback? onPressed;

  const hostelwidget(
      {required this.onPressed,
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
        color: const Color(0xff701B52),
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
                  color: Colors.white70),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text(
                'Non Ac Rooms - 3 seater $room1 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white70),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text(
                'Ac Rooms - 3 seater $room2 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white70),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text(
                'Non Ac Rooms - 2 seater $room3 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white70),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text(
                'Ac Rooms - 2 seater $room4 available',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white70),
              ),
              onPressed: () {},
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
  final VoidCallback? onPressed;

  const messwidget(
      {required this.onPressed,
      required this.day,
      required this.food1,
      required this.food2,
      required this.food3});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff701B52),
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
                color: Colors.white70),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
            ),
            child: Text(
              food1,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white70),
            ),
            onPressed: () {},
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
            ),
            child: Text(
              food2,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white70),
            ),
            onPressed: () {},
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
            ),
            child: Text(
              food3,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white70),
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
