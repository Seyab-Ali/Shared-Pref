import 'dart:async';
import 'package:shared_pref/home_screen.dart';
import 'package:shared_pref/student_screen.dart';
import 'package:shared_pref/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
    // Timer(const Duration(seconds: 3), (){
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return const LoginScreen();
    // }));
    // });
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'student') {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const StudentScreen();
          }));
        });
      } else if (userType == 'teacher') {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const TeacherScreen();
          }));
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomeScreen();
          }));
        });
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: const Image(
        image: AssetImage('assets/images/apple.jpg'),
        fit: BoxFit.fitWidth,
        height: double.infinity,
      ),
    );
  }
}
