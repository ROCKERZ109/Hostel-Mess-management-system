import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miniproject12/homepage.dart';
import 'change.dart';
import 'sizeConfig.dart';
import 'login.dart';

class Student extends StatefulWidget {
  static var id = 'Student';
  static String hosdat = "";
  static String messdat = "";
  static bool exist = false;
  static String validated = "";
  static String hostelname = "";
  static bool messexist = false;
  static var messvalidated = "";
  const Student({Key? key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  CollectionReference users = FirebaseFirestore.instance.collection('Student');
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('Student')
      .where('name', isEqualTo: '${Login.name}')
      .snapshots();

  List<String> week = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  //static var hostelname = "Chandra Shekhar Non AC 3 seater";
  var variable = FirebaseFirestore.instance
      .collection('Hostel')
      .doc('${Login.name}')
      .get()
      .then((value) => value.get('hostel'));

  void getdetail() async {
   var val;
    var variable = await FirebaseFirestore.instance
        .collection('Hostel')
        .doc('${Login.name}')
        .get()
        .then((value) {
      val = value.get('hostel');
    });
    await FirebaseFirestore.instance
        .collection('Hostel')
        .doc('${Login.name}')
        .get()
        .then((value) {
      setState(() {
        Student.exist = value.exists;


      });
    });

    await FirebaseFirestore.instance
        .collection('Hostel')
        .doc('${Login.name}')
        .get()
        .then((value) {
      setState(() {
        Student.validated = value.get('validated');

      });
    });

    await FirebaseFirestore.instance
        .collection('Hostel')
        .doc('${Login.name}')
        .get()
        .then((value) {
      setState(() {
        Student.hostelname = value.get('hostel');

      });
    });
    await FirebaseFirestore.instance
        .collection('Student')
        .doc('${Login.name}')
        .get()
        .then((value) {
      setState(() {
        Student.messexist = value.exists;

      });
    });
    await FirebaseFirestore.instance
        .collection('Student')
        .doc('${Login.name}')
        .get()
        .then((value) {
      setState(() {

        Student.messvalidated = value.get('validated');
        print(Student.messvalidated);

      });
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    getdetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor:Color(0XFF023455),
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
        decoration: const BoxDecoration(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 450,
                  width: 500,
                  child: Card(
                    color:Color(0XFF023455),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 7.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Your Mess Details\n',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 350,
                          width: 500,
                          child:Student.messexist?
                          (Student.messvalidated=="true"? StreamBuilder<QuerySnapshot>(
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

                                return ListView.separated(
                                    itemCount: 6,
                                    separatorBuilder: (_, index) => SizedBox(
                                          height: 30,
                                        ),
                                    itemBuilder: (_, index) {
                                      return Center(
                                        child: Text(
                                          '${week[index]} - ${data.docs[0][week[index]]}',
                                          style: const TextStyle(
                                              fontSize: 17.50,
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                        ),
                                      );
                                    });
                              }):Center(
                                child: Text('Requested',
                          style: const TextStyle(
                                fontSize: 17.50,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                              )):Center(
                            child: Text('Doesn\'t Exist',
                            style: const TextStyle(
                            fontSize: 22,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color:Color(0XFF023455),
                    elevation: 5.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Change.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        height: 40,
                        width: 150,
                        child: const Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                // Center(
                //   child: Container(
                //     decoration:
                //         BoxDecoration(borderRadius: BorderRadius.circular(50)),
                //     height: 50,
                //     width: 100,
                //     child: Card(
                //       color: const Color(0xff701B52),
                //       child: Center(
                //         child: Text(
                //           Student.messdat == 'true' ? 'Approved' : 'Requested',
                //           style: const TextStyle(
                //               fontSize: 15,
                //               fontFamily: 'Nunito Sans',
                //               fontWeight: FontWeight.w900,
                //               color: Colors.white70),
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 400,
                  width: 500,
                  child: Card(
                    color:Color(0XFF023455),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 7.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Your Hostel Details',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Text(
                          Student.exist
                              ? (Student.validated == "true"
                                  ? '${Student.hostelname}'
                                  : 'Requested')
                              : 'Doesn\'t exist',
                          style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color:Color(0XFF023455),
                    elevation: 5.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Change.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        height: 40,
                        width: 150,
                        child: const Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
