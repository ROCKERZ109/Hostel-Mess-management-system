import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'sizeConfig.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  static var id = 'HomePage';
  static bool checkLoad = true;
  static double ScreenSize = 960;
  static bool state = false;

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? url;
  late YoutubePlayerController controller;

  void runYoutube() {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/embed/zTeMlXfYWKE')!,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        forceHD: true,
      ),
    );
  }

  ScrollController _controller = ScrollController();

  void moveTo(dynamic offset) {
    _controller.animateTo(
      offset,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addQuery() {
    FirebaseFirestore.instance
        .collection("Query")
        .doc(nameControllers.text)
        .set(
          {
            'name': nameControllers.text,
            'email': emailController.text,
            'phone': phoneController.text,
            "query": queryController.text,
          },
          SetOptions(merge: true),
        )
        .then((value) => print("Query sent"))
        .catchError((error) => print("Failed to merge data: $error"));
  }

  Color kcolor = Color(0XFF023455);

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  TextEditingController nameControllers = TextEditingController();

  @override
  void initState() {
    runYoutube();

    setState(() {
      HomePage.checkLoad = false;
    });

    super.initState();
  }

  @override
  void deactivate() {
    controller.pause();
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.red,
                  height: 650,
                  width: SizeConfig.safeBlockHorizontal * 100,
                  child: const Material(
                    child: Image(
                      image: AssetImage(
                        'assets/graphic.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  // color: Colors.black.withOpacity(0.5),
                  height: 650,
                  width: SizeConfig.safeBlockHorizontal * 100,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 110.0,
                        width: SizeConfig.safeBlockHorizontal * 100,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 17,
                              child: Material(
                                color: Colors.transparent,
                                child: Image.asset(
                                  'assets/logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 35,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Login.user = 'Student';
                                  });
                                  Navigator.pushNamed(context, Login.id);
                                },
                                hoverColor: Color(0XFF023455),
                                child: Container(
                                  width: SizeConfig.safeBlockHorizontal * 9.5,
                                  height: 110,
                                  //  width: SizeConfig.safeBlockHorizontal*8.5,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: AutoSizeText(
                                      'Student Login',
                                      maxFontSize: 20,
                                      minFontSize: 15,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: 'Nunito Sans',
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3.50,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Login.user = 'Admin';
                                  });
                                  Navigator.pushNamed(context, Login.id);
                                },
                                hoverColor: Color(0XFF023455),
                                child: Container(
                                  width: SizeConfig.safeBlockHorizontal * 9.5,
                                  height: 110,
                                  // width: SizeConfig.safeBlockHorizontal*8.5,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: AutoSizeText(
                                      'Admin Login',
                                      maxFontSize: 20,
                                      minFontSize: 15,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: 'Nunito Sans',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3.50,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  moveTo(1500);
                                },
                                child: Container(
                                  height: 110,
                                  width: SizeConfig.safeBlockHorizontal * 9.5,
                                  //width: SizeConfig.safeBlockHorizontal*8.5 ,
                                  color: Color(0XFF023455),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(6.50),
                                      child: AutoSizeText(
                                        'Contact Us',
                                        maxFontSize: 17,
                                        minFontSize: 10,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: 'Nunito Sans',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 250,
                          left: 50,
                          child: SizedBox(
                            height: 150,
                            width: SizeConfig.safeBlockHorizontal * 40,
                            child: const Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.only(),
                                // child: Text(
                                //   'Increase Patient Volume with a Specialized Healthcare Performance Marketing Agency',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w900,
                                //       fontFamily: 'Nunito Sans',
                                //       fontSize: 33,
                                //       color:Colors.lightBlueAccent),
                                // ),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 400,
                          left: 50,
                          child: SizedBox(
                            height: 80,
                            width: SizeConfig.safeBlockHorizontal * 50,
                            child: const Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.only(),
                                // child: Text(
                                //   'Helping healthcare organizations grow with patient centered digital paid media & SEO strategies ',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w900,
                                //       fontFamily: 'Nunito Sans',
                                //       fontSize: 17.5,
                                //       color: Colors.white),
                                // ),
                              ),
                            ),
                          )),
                      const Positioned(
                        top: 530,
                        left: 50,
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: Center(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 200,
              width: SizeConfig.safeBlockHorizontal * 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'At Graphic Era Hostels',
                    style: TextStyle(
                        fontSize: 27,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 300,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 55,
                          child: Image.asset('assets/verified.png'),
                        ),
                        const Text(
                          '24*7 security to ensure the safety of students and to avoid misconduct inside the hostel.',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.white,
                              //  color: Color(0xff04D7BD),
                              fontFamily: 'Nunito Sans'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 55,
                          child: Image.asset('assets/wifi.png'),
                        ),
                        const Text(
                          'Graphic Era hostels have 24*7 wifi services for students to help them with their studies.                                                                                                                                       ',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.white,
                              //  color: Color(0xff04D7BD),
                              fontFamily: 'Nunito Sans'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 75,
                          child: Image.asset(
                            'assets/ragging3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          'Ragging is strictly banned in the college as well as in the Hostel.',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.white,
                              //  color: Color(0xff04D7BD),
                              fontFamily: 'Nunito Sans'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0XFF023455),
                  Color(0XFF045D99),
                  // Colors.green,
                  // Colors.greenAccent
                ],
              )),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0XFF045D99),
                  Color(0XFF023455),

                  // Colors.green,
                  // Colors.greenAccent
                ],
              )),
              height: 400,
              width: SizeConfig.safeBlockHorizontal * 100,
              child: CustomPaint(
                size: Size(SizeConfig.safeBlockHorizontal * 100, 400),
                painter: CurvedPainter(),
                child: Stack(
                  children: [
                    Positioned(
                      top: SizeConfig.safeBlockHorizontal * 5,
                      left: SizeConfig.safeBlockHorizontal * 5,
                      child: SizedBox(
                        height: 300,
                        width: SizeConfig.safeBlockHorizontal * 25,
                        child: Column(
                          children: const [
                            Text(
                              'Our Students\' words',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '"I feel like I am home."',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '-Satyam Kumar',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 80,
                      left: SizeConfig.safeBlockHorizontal * 55,
                      child: Container(
                        height: 300,
                        color: Colors.black,
                        child: const HtmlElementView(viewType: "video"),
                        // child: YoutubePlayerBuilder(
                        //   player: YoutubePlayer(
                        //     controller: controller,
                        //     showVideoProgressIndicator: true,
                        //     width: 400,
                        //   ),
                        //   builder: (context, player) {
                        //     return Container(
                        //       height: 300,
                        //       child: player,
                        //     );
                        //   },
                        // ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 335,
              width: SizeConfig.safeBlockHorizontal * 100,
              color: Color(0XFF023455),
              // decoration: BoxDecoration(
              //     image:
              //     DecorationImage(image: AssetImage('assets/pnglogo.png'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Text(
                      'Our Vision',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: const Text(
                      'Graphic Era University comprises of separate hostels for boys and girls. The management tried best to provide a second home to the students. The surrounding is beautiful and refreshing that gives an ideal environment for studies. Hostel rooms are airy and spacious with all the basic amenities such as a table, chair, wardrobe, study table, etc.',
                      style: TextStyle(
                          fontSize: 16.75,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: const Text(
                      'Certain guidelines are explained to students when they join hostel, and students have to abide by the hostel rules. Management takes strict action in case of violation. Girl’s hostel, as well as boy’s hostel, has separate warden that looks after the discipline and requirements of students. Electricity and water supply is available 24/7. Student’s security is the topmost concern of the management. Thus security staff is present in the hostel campus. The hostel mess provides hygienic, nutritious, and a variety of delicacies to the students.',
                      style: TextStyle(
                          fontSize: 16.75,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: const Text(
                      'The medical facility is also available, and in case of emergency, the staff takes complete care students. Girl’s hostel is equipped with a separate computer center to facilitate late studies for girls. All the physical training equipments are available in the hostel so that students can spend some time on their fitness. Laundry facility within the campus saves time, and student can carry on their studies without interruption',
                      style: TextStyle(
                          fontSize: 16.75,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 350,
              width: SizeConfig.safeBlockHorizontal * 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/back.jpg'), fit: BoxFit.fill)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 45,
                  ),
                  SizedBox(
                    height: 350,
                    width: SizeConfig.safeBlockHorizontal * 35,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Have A Query?',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w900,
                            color: Color(0XFF023455),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Divider(
                          thickness: 2.5,
                          color: Color(0XFF023455),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Fill out the form to get started!',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w900,
                              color: Color(0xff515151)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 10,
                  ),
                  HomePage.state
                      ? const Text(
                          'Thank you! We\'ll get back to you as soon as possible',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w900,
                              color: Color(0xff515151)),
                        )
                      : SizedBox(
                          height: 350,
                          width: SizeConfig.safeBlockHorizontal * 45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  FormWidget(
                                    hintText: 'First name',
                                    width: 137.5,
                                    maxLines: 1,
                                    height: 40,
                                    controller: nameControllers,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const FormWidget(
                                    hintText: 'Last name',
                                    width: 137.50,
                                    maxLines: 1,
                                    height: 40,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              FormWidget(
                                  hintText: 'Email',
                                  width: 280,
                                  maxLines: 1,
                                  height: 40,
                                  controller: emailController),
                              const SizedBox(
                                height: 5,
                              ),
                              FormWidget(
                                  hintText: 'Phone',
                                  width: 280,
                                  maxLines: 1,
                                  height: 40,
                                  controller: phoneController),
                              const SizedBox(
                                height: 5,
                              ),
                              FormWidget(
                                hintText: 'How can we help you?',
                                width: 280,
                                maxLines: 4,
                                height: 100,
                                controller: queryController,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Material(
                                color: Color(0XFF023455),
                                elevation: 5.0,
                                child: InkWell(
                                  onTap: () {
                                    addQuery();
                                    print('xallewd');
                                    setState(() {
                                      HomePage.state = true;
                                    });
                                    //initState();
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                                  },
                                  splashColor: Color(0XFF023455),
                                  child: const SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'Submit',
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
                        )
                ],
              ),
            ),
            Container(
              height: 361,
              width: SizeConfig.safeBlockHorizontal * 100,
              color: Color(0XFF023455),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Connect With Us',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 180,
                        width: SizeConfig.safeBlockHorizontal * 28,
                        child: Column(
                          children: [
                            const Center(
                              child: Text(
                                'Social Media',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        html.window.open(
                                            'https://www.instagram.com/geuofficial/',
                                            "_blank");
                                      },
                                      hoverColor: Colors.redAccent,
                                      child: const Icon(
                                        FontAwesome.instagram,
                                        size: 37.5,
                                        color: Colors.red,
                                      )),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        html.window.open(
                                            'https://www.facebook.com/geuofficial/',
                                            "_blank");
                                      },
                                      hoverColor: Colors.lightBlueAccent,
                                      child: const Icon(
                                        FontAwesome.facebook,
                                        size: 37.5,
                                        color: Colors.blue,
                                      )),
                                ),
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        customBorder: const CircleBorder(),
                                        onTap: () {
                                          html.window.open(
                                              'https://twitter.com/GEU_Official',
                                              "_blank");
                                        },
                                        hoverColor: Colors.lightBlueAccent,
                                        child: const Icon(
                                          Typicons.twitter,
                                          size: 37.5,
                                          color: Colors.blue,
                                        ))),
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        html.window.open(
                                            'https://www.youtube.com/GraphicEraOfficial',
                                            "_blank");
                                      },
                                      hoverColor: Colors.redAccent,
                                      child: const Icon(
                                        FontAwesome.youtube,
                                        size: 37.5,
                                        color: Colors.black,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 180,
                          width: SizeConfig.safeBlockHorizontal * 25,
                          child: Column(children: [
                            const Center(
                              child: Text(
                                'Contacts',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 7.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(FontAwesome.phone, size: 20),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '1800 270 1280',
                                  style: TextStyle(
                                      fontSize: 14.5,
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(FontAwesome.phone, size: 20),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '7456803478',
                                  style: TextStyle(
                                      fontSize: 14.5,
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(FontAwesome.mail, size: 20),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'admissions@geu.ac.in',
                                  style: TextStyle(
                                      fontSize: 14.5,
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ]))
                    ],
                  ),
                  const Text(
                    'Built By Upendra Pandit',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //
    ));
  }
}

class FormWidget extends StatelessWidget {
  final String hintText;
  final double width;
  final double height;
  final int maxLines;
  final TextEditingController? controller;

  const FormWidget(
      {required this.hintText,
      required this.width,
      required this.maxLines,
      required this.height,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.bottom,
          maxLines: maxLines,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito Sans'),
          decoration: InputDecoration(
              hintTextDirection: TextDirection.ltr,
              filled: true,
              fillColor: Colors.white,
              hintText: '$hintText*',
              hintStyle: const TextStyle(
                fontSize: 13,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 7.0),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF023455), width: 1.75),
              ))),
    );
  }
}
//
// class ServeContainer extends StatelessWidget {
//   final String assetLink;
//   final String name;
//
//   ServeContainer({required this.assetLink, required this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(
//                 assetLink,
//               ),
//               fit: BoxFit.fill)),
//       //color:Colors.white,
//       height: 220,
//       width: 250,
//       child: Material(
//         elevation: 5.0,
//         child: Center(
//           child: Text(
//             name,
//             style: TextStyle(
//               fontSize: 30,
//               fontFamily: 'Nunito Sans',
//               fontWeight: FontWeight.w900,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 100;

    var path = Path();

    path.moveTo(0.0, size.height * 1);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.2, size.width * 1, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ServiceContainer extends StatelessWidget {
  final String assetLink;
  final String text;
  final bool check;

  const ServiceContainer(
      {required this.assetLink, required this.text, required this.check});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: check ? 135 : 125,
      width: check ? 165 : SizeConfig.safeBlockHorizontal * 11,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Image.asset(assetLink,
                  height: check ? 115 : 85,
                  width: check ? 165 : SizeConfig.safeBlockHorizontal * 11,
                  fit: BoxFit.fill)),
          Text(
            text,
            style: TextStyle(
                fontSize: check ? 15 : 13,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ServicesContainer extends StatelessWidget {
  final String assetLink;
  final String text;

  const ServicesContainer({required this.assetLink, required this.text});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 17.5,
      width: SizeConfig.safeBlockHorizontal * 30.5,
      child: Column(
        children: [
          SizedBox(
              height: SizeConfig.safeBlockVertical * 14,
              width: SizeConfig.safeBlockHorizontal * 30.5,
              child: Image(
                  image: AssetImage(
                    assetLink,
                  ),
                  fit: BoxFit.contain)),
          AutoSizeText(
            text,
            minFontSize: 6,
            maxFontSize: 14,
            maxLines: 1,
            style: const TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// class FormWidget extends StatelessWidget {
//   final String hintText;
//   final double width;
//   final double height;
//   final int maxLines;
//   final TextEditingController? controller;
//
//   FormWidget(
//       {required this.hintText,
//       required this.width,
//       required this.maxLines,
//       required this.height,
//       this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       child: TextFormField(
//           controller: controller,
//           textAlignVertical: TextAlignVertical.bottom,
//           maxLines: maxLines,
//           style: TextStyle(
//               fontSize: 15,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'Nunito Sans'),
//           decoration: InputDecoration(
//               hintTextDirection: TextDirection.ltr,
//               filled: true,
//               fillColor: Colors.white,
//               hintText: '$hintText*',
//               hintStyle: TextStyle(
//                 fontSize: 13,
//                 fontFamily: 'Nunito Sans',
//                 fontWeight: FontWeight.w300,
//                 color: Colors.grey,
//               ),
//               border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 7.0),
//                   borderRadius: BorderRadius.circular(4)),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.teal, width: 1.75),
//               ))),
//     );
//   }
// }
// //
// // class ServeContainer extends StatelessWidget {
// //   final String assetLink;
// //   final String name;
// //
// //   ServeContainer({required this.assetLink, required this.name});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //           image: DecorationImage(
// //               image: AssetImage(
// //                 assetLink,
// //               ),
// //               fit: BoxFit.fill)),
// //       //color:Colors.white,
// //       height: 220,
// //       width: 250,
// //       child: Material(
// //         elevation: 5.0,
// //         child: Center(
// //           child: Text(
// //             name,
// //             style: TextStyle(
// //               fontSize: 30,
// //               fontFamily: 'Nunito Sans',
// //               fontWeight: FontWeight.w900,
// //               color: Colors.white,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class CurvedPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 100;
//
//     var path = Path();
//
//     path.moveTo(0.0, size.height * 1);
//     path.quadraticBezierTo(
//         size.width * 0.8, size.height * 0.2, size.width * 1, size.height * 0.8);
//     path.quadraticBezierTo(size.width * 0.5, size.height * 0.9,
//         size.width * 1.0, size.height * 0.8);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
// class ServiceContainer extends StatelessWidget {
//   final String assetLink;
//   final String text;
//   final bool check;
//
//   ServiceContainer(
//       {required this.assetLink, required this.text, required this.check});
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       height: check ? 135 : 125,
//       width: check ? 165 : SizeConfig.safeBlockHorizontal * 11,
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius:BorderRadius.only(bottomLeft: Radius.circular(15),
//               topRight: Radius.circular(15) )
//             ),
//               child: Image.asset(assetLink,
//                   height: check ? 115 : 85,
//                   width: check ? 165 : SizeConfig.safeBlockHorizontal * 11,
//                   fit: BoxFit.fill)),
//           Text(
//             text,
//             style: TextStyle(
//                 fontSize: check ? 15 : 13,
//                 fontFamily: 'Nunito Sans',
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ServicesContainer extends StatelessWidget {
//   final String assetLink;
//   final String text;
//
//   ServicesContainer({required this.assetLink, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       height: SizeConfig.safeBlockVertical * 17.5,
//       width: SizeConfig.safeBlockHorizontal * 30.5,
//       child: Column(
//         children: [
//           Container(
//               height: SizeConfig.safeBlockVertical * 14,
//               width: SizeConfig.safeBlockHorizontal * 30.5,
//               child: Image(
//                   image: AssetImage(
//                     assetLink,
//                   ),
//                   fit: BoxFit.contain)),
//           AutoSizeText(
//             text,
//             minFontSize: 6,
//             maxFontSize: 14,
//             maxLines: 1,
//             style: TextStyle(
//                 fontFamily: 'Nunito Sans',
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
