import 'package:flutter/material.dart';
import 'package:miniproject12/admin.dart';
import 'package:miniproject12/login.dart';
import 'package:miniproject12/student.dart';
import 'homepage.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
import 'change.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAZbPRQBPv6Sl-FQbPtNPeYvQAYOlArDn0",
          appId: "1:506409080642:web:d0702268eb5791f4479adb",
          messagingSenderId: "506409080642",
          projectId: "mini-955ce"));
  ui.platformViewRegistry.registerViewFactory(
      'video',
      (int viewId) => html.IFrameElement()
        ..width = '640'
        ..height = '360'
        ..style.width = '640'
        ..src = 'https://www.youtube.com/embed/zTeMlXfYWKE'
        ..style.border = 'none');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        Login.id: (context) => const Login(),
        Student.id: (context) => const Student(),
        Change.id: (context) => const Change(),
        Admin.id: (context) => const Admin(),
      },
    );
  }
}
