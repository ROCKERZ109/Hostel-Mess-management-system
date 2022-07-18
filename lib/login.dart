import 'package:flutter/material.dart';
import 'package:miniproject12/student.dart';
import 'sizeConfig.dart';
import 'admin.dart';

class Login extends StatefulWidget {
  static var id = 'Login';
  static var user = 'Student';
  static var name;
  static var ids;

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController idwordcontroller = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SizedBox(
            height: SizeConfig.safeBlockVertical * 100,
            width: SizeConfig.safeBlockHorizontal * 100,
            child: Stack(children: [
              SizedBox(
                height: SizeConfig.safeBlockVertical * 100,
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
                height: 100.0,
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
                  ],
                ),
              ),
              Center(
                child: Material(
                  color: Colors.transparent,
                  elevation: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [


                            Color(0XFF023455).withOpacity(0.5),
                            Color(0XFF045D99).withOpacity(0.5),
                            // Colors.green,
                            // Colors.greenAccent
                          ],
                        )),
                    height: 400,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Welcome ${Login.user} !\nPlease fill in your credentials.',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Nunito Sans',
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        LoginFormWidget(
                          hintText: 'User Id',
                          width: 250,
                          maxLines: 1,
                          height: 35,
                          controller: namecontroller,
                        ),
                        LoginFormWidget(
                          hintText: 'Password',
                          width: 250,
                          maxLines: 1,
                          height: 35,
                          controller: idwordcontroller,
                        ),
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color:  Color(0XFF023455),
                          elevation: 5.0,
                          child: InkWell(
                            // customBorder:new CircleBorder(
                            //   side: BorderSide(width: 50,color: Colors.purple)
                            //
                            // ),

                            onTap: () {
                              // Auth();
                              // print('xallewd');
                              setState(() {
                                // HomePage.state = true;
                                Login.name = namecontroller.text;
                                Login.ids = idwordcontroller.text;
                              });
                              Login.user == 'Student'
                                  ? Navigator.pushNamed(context, Student.id)
                                  : Navigator.pushNamed(context, Admin.id);
                              // initState();
                              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                            },

                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              height: 40,
                              width: 150,
                              child: const Center(
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
                  ),
                ),
              )
            ])));
  }
}

class LoginFormWidget extends StatelessWidget {
  final String hintText;
  final double width;
  final double height;
  final int maxLines;
  final TextEditingController? controller;

  const LoginFormWidget(
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
              fillColor: Colors.white70,
              hintText: '$hintText*',
              hintStyle: const TextStyle(
                fontSize: 13,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 7.0),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff701B52), width: 1.75),
              ))),
    );
  }
}
